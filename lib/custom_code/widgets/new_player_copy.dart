// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

//Обязательно добавить в пермишенны андроида FOREGROUND_SERVICE_MEDIA_PLAYBACK, WAKE_LOCK и FOREGROUND_SERVICE прям в фф (и того 3 штуки)!
//Обязательно добавить в ФФ в мейн экшен justAudioBackground (есть в тим виджетах) в инициализацию!
// инфо что еще куда добавиь тут https://pub.dev/packages/just_audio_background
//

import 'package:audio_session/audio_session.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async' as cTime;
import 'dart:math';
import 'package:just_audio/just_audio.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class NewPlayerCopy extends StatefulWidget {
  const NewPlayerCopy({
    Key? key,
    this.url,
    this.ksecBack,
    this.kplay,
    this.kpause,
    this.ksecForward,
    this.kRepeatOn,
    this.kRepeatOff,
    this.width,
    this.height,
    required this.playSize,
    required this.notificationImagePath,
    required this.notificationTitle,
    required this.notificationAlbum,
    required this.playAction,
    required this.oneMinuteAction,
    required this.showRepeatButton,
    required this.showSpeedButton,
    this.primaryColor,
    this.secondaryColor,
    this.bufferingColor,
    required this.backAction,
    required this.forwardAction,
  }) : super(key: key);

  final String? url;
  final Widget? ksecBack;
  final Widget? kplay;
  final Widget? kpause;
  final Widget? ksecForward;
  final Widget? kRepeatOn;
  final Widget? kRepeatOff;
  final double? width;
  final double? height;
  final double? playSize;
  final String notificationImagePath;
  final String notificationTitle;
  final String notificationAlbum;
  final void Function() playAction;
  final void Function() oneMinuteAction;
  final bool showRepeatButton;
  final bool showSpeedButton;
  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? bufferingColor;
  final void Function() backAction;
  final void Function() forwardAction;

  @override
  _NewPlayerCopyState createState() => _NewPlayerCopyState();
}

class _NewPlayerCopyState extends State<NewPlayerCopy> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late AudioPlayer audioPlayer;
  late AudioPlayer defaultAudioPlayer;
  bool isPlaying = false;
  bool isSleepOn = false;
  bool isRepeat = false;
  Future? timer;
  int time = 0;
  bool? isChecked = false;
  DownloadState downloadState = DownloadState.inactive;
  Stream<FileResponse>? fileStream;
  String? localUrl;
  int timeForDatabase = 0;
  bool isUserValueUpdated = false;
  cTime.Timer? timerClone;
  double? _dragValue;

  static const double normalPlaySpeed = 1;
  final playSpeedValues = <double>[normalPlaySpeed, 1.25, 1.5, 2];
  double currentPlaySpeed = normalPlaySpeed;

  initListeners(AudioPlayer player) {
    player.playbackEventStream.listen(
      (event) {},
      onError: (Object e, StackTrace stackTrace) {
        print('A stream error occurred: $e');
      },
      onDone: () {},
    );
    player.playerStateStream.listen(
      (event) {
        if (event.playing) {
          timerClone ??=
              cTime.Timer.periodic(const Duration(seconds: 1), (timer) {
            timerHandler(timer);
          });
        } else {
          timerClone?.cancel();
          timerClone = null;
        }
      },
    );
  }

  Future<void> _init() async {
    audioPlayer = AudioPlayer();
    initListeners(audioPlayer);
    defaultAudioPlayer = AudioPlayer();
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    await getLocalUrlIfExist();
    await setAudioSource();
  }

  Future<void> setAudioSource() async {
    if (localUrl != null) {
      audioPlayer = AudioPlayer();
      initListeners(audioPlayer);
    }
    final playList = AudioSource.uri(
      localUrl != null
          ? Uri.file(localUrl!, windows: false)
          : Uri.parse(widget.url!),
      tag: MediaItem(
        id: 'id${widget.url}',
        album: widget.notificationAlbum,
        title: widget.notificationTitle,
        artUri: Uri.parse(widget.notificationImagePath),
      ),
    );
    try {
      await audioPlayer.setAudioSource(playList);
      print('Complate setAudioSource');
    } catch (e, stackTrace) {
      // Catch load errors: 404, invalid url ...
      print("Error loading playlist: $e");
      print(stackTrace);
    }
  }

  void changeSleepStatus(bool value) {
    setState(() {
      isSleepOn = value;
    });
  }

  void changePlayingStatus(bool value) {
    setState(() {
      isPlaying = value;
    });
  }

  Future<FileInfo?> getLocalUrlIfExist() async {
    print('-------------getLocalUrlIfExist START--------');
    final FileInfo? value =
        await DefaultCacheManager().getFileFromCache(widget.url!);
    if (value != null) {
      setState(() {
        localUrl = value.file.path;
        downloadState = DownloadState.downloaded;
      });
      print('-------------getLocalUrlIfExist END ${value.file.path}--------');
    }
    return value;
  }

  @override
  void initState() {
    super.initState();
    // getLocalUrlIfExist();
    _init();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    timerClone?.cancel();
    super.dispose();
  }

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          audioPlayer.positionStream,
          audioPlayer.bufferedPositionStream,
          audioPlayer.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: StreamBuilder<PositionData>(
        stream: _positionDataStream,
        builder: (context, snapshot) {
          final positionData = snapshot.data;
          final duration = positionData?.duration ?? Duration.zero;
          final maxDuration = duration.inMilliseconds.toDouble();
          final position = positionData?.position ?? Duration.zero;
          var posSec = position.inHours > 0
              ? position.toString().split('.').first.padLeft(8, "0")
              : position.toString().substring(2, 7);
          var durSec = duration.inHours > 0
              ? duration.toString().split('.').first.padLeft(8, "0")
              : duration.toString().substring(2, 7);
          final bufferedPosition =
              positionData?.bufferedPosition ?? Duration.zero;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                children: [
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.blue.shade100,
                      inactiveTrackColor: Colors.grey.shade300,
                      thumbColor: Colors.transparent,
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 0.0),
                    ),
                    child: ExcludeSemantics(
                      child: Slider(
                        activeColor: widget.bufferingColor ??
                            const Color.fromARGB(255, 255, 0, 0),
                        inactiveColor: widget.secondaryColor ??
                            const Color.fromARGB(255, 9, 255, 0),
                        min: 0.0,
                        max: maxDuration,
                        value: min(bufferedPosition.inMilliseconds.toDouble(),
                            maxDuration),
                        onChanged: (_) {},
                      ),
                    ),
                  ),
                  Slider(
                    activeColor: widget.primaryColor ??
                        const Color.fromARGB(255, 254, 233, 0),
                    inactiveColor: widget.secondaryColor ??
                        const Color.fromARGB(255, 60, 0, 255),
                    min: 0.0,
                    max: maxDuration,
                    value: min(_dragValue ?? position.inMilliseconds.toDouble(),
                        duration.inMilliseconds.toDouble()),
                    onChanged: (value) {
                      setState(() {
                        _dragValue = value;
                      });
                    },
                    onChangeEnd: (value) {
                      audioPlayer.seek(Duration(milliseconds: value.toInt()));
                      _dragValue = null;
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      posSec,
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                    Text(
                      durSec,
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 23),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    widget.showRepeatButton
                        ? SizedBox(
                            width: 50,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  audioPlayer.setLoopMode(
                                      isRepeat ? LoopMode.one : LoopMode.all);
                                  isRepeat = !isRepeat;
                                });
                              },
                              child: isRepeat
                                  ? Align(
                                      alignment: Alignment.centerLeft,
                                      child: widget.kRepeatOn)
                                  : Align(
                                      alignment: Alignment.centerLeft,
                                      child: widget.kRepeatOff),
                            ),
                          )
                        : SizedBox(
                            width: 50,
                            child: Container(),
                          ),
                    SizedBox(
                      width: 50,
                      child: GestureDetector(
                        onTap: () {
                          audioPlayer.stop();
                          audioPlayer.dispose();
                          widget.backAction();
                          // setState(() {
                          //   audioPlayer.seek(
                          //     Duration(
                          //       seconds: position.inSeconds - 10 < 0
                          //           ? 0
                          //           : position.inSeconds - 10,
                          //     ),
                          //   );
                          // });
                        },
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: widget.ksecBack),
                      ),
                    ),
                    StreamBuilder<PlayerState>(
                      stream: audioPlayer.playerStateStream,
                      builder: (context, snapshot) {
                        final playerState = snapshot.data;
                        final processingState = playerState?.processingState;
                        final playing = playerState?.playing;
                        if (processingState == ProcessingState.completed) {
                          audioPlayer.seek(Duration.zero);
                          audioPlayer.pause();
                        }
                        if (processingState == ProcessingState.loading ||
                            processingState == ProcessingState.buffering) {
                          return Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).accent1,
                              shape: BoxShape.circle,
                            ),
                            alignment: AlignmentDirectional.center,
                            width: widget.playSize! + 20,
                            height: widget.playSize! + 20,
                            child: Align(
                                alignment: Alignment.center,
                                child: widget.kplay),
                            //child: const CircularProgressIndicator(
                            //  color: const Color(0xFF4D24A7),
                            //),
                          );
                        } else if (playing != true) {
                          return GestureDetector(
                            onTap: () {
                              widget.playAction();
                              audioPlayer.play();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).accent1,
                                shape: BoxShape.circle,
                              ),
                              width: widget.playSize! + 20,
                              height: widget.playSize! + 20,
                              alignment: AlignmentDirectional.center,
                              child: Align(
                                  alignment: Alignment.center,
                                  child: widget.kplay),
                            ),
                          );
                        } else if (processingState !=
                            ProcessingState.completed) {
                          return GestureDetector(
                            onTap: audioPlayer.pause,
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).accent1,
                                shape: BoxShape.circle,
                              ),
                              width: widget.playSize! + 20,
                              height: widget.playSize! + 20,
                              alignment: AlignmentDirectional.center,
                              child: Align(
                                  alignment: Alignment.center,
                                  child: widget.kpause),
                            ),
                          );
                        } else {
                          return GestureDetector(
                            onTap: audioPlayer.play,
                            child: Container(
                              width: widget.playSize! + 20,
                              height: widget.playSize! + 20,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).accent1,
                                shape: BoxShape.circle,
                              ),
                              alignment: AlignmentDirectional.center,
                              child: Align(
                                  alignment: Alignment.center,
                                  child: widget.kplay),
                            ),
                          );
                        }
                      },
                    ),
                    SizedBox(
                      width: 50,
                      child: GestureDetector(
                        onTap: () {
                          audioPlayer.stop();
                          audioPlayer.dispose();
                          widget.forwardAction();
                          // setState(() {
                          //   audioPlayer.seek(
                          //     Duration(
                          //       seconds: position.inSeconds + 10 < 0
                          //           ? 0
                          //           : position.inSeconds + 10,
                          //     ),
                          //   );
                          // });
                        },
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: widget.ksecForward),
                      ),
                    ),
                    widget.showSpeedButton
                        ? SizedBox(
                            width: 50,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  final currentPlaySpeedIndex =
                                      playSpeedValues.indexOf(currentPlaySpeed);
                                  if (currentPlaySpeedIndex ==
                                      playSpeedValues.length - 1) {
                                    currentPlaySpeed = playSpeedValues.first;
                                  } else {
                                    currentPlaySpeed = playSpeedValues[
                                        currentPlaySpeedIndex + 1];
                                  }

                                  audioPlayer.setSpeed(currentPlaySpeed);
                                });
                              },
                              child: Text(
                                '${speedToString(currentPlaySpeed)} x',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  color: currentPlaySpeed == normalPlaySpeed
                                      ? FlutterFlowTheme.of(context).primaryText
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          )
                        : SizedBox(
                            width: 50,
                            child: Container(),
                          ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  String speedToString(double value) {
    if ((value * 100).remainder(100) == 0) {
      return value.round().toString();
    } else {
      return value.toString();
    }
  }

  void timerHandler(cTime.Timer timer) async {
    timeForDatabase++;
    if (timeForDatabase % 60 == 0) {
      widget.oneMinuteAction();
    }
  }
}

extension IntToTime on int {
  String toTime() {
    const String minute = ':00';
    if (this < 60) {
      if (this < 10) {
        return '0${this}$minute';
      }
      return '${this}$minute';
    } else {
      int fold = this ~/ 60;
      int min = this - fold * 60;
      if (min < 10) {
        return '$fold:0$min$minute';
      }
      return '$fold:$min$minute';
    }
  }
}

enum DownloadState { inactive, inprogress, downloaded, notDownloaded }

class PositionData {
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;

  PositionData(this.position, this.bufferedPosition, this.duration);
}

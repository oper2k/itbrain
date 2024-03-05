// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your widget name, define your parameter, and then add the
// boilerplate code using the button on the right!
import 'dart:io';
import 'dart:async';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:provider/provider.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({
    Key? key,
    this.width,
    this.height,
    this.playId,
    this.activeColor,
    this.inactiveColor,
    this.id,
    this.title,
    this.duration,
    this.image,
    this.audioPath,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? playId;
  final Color? activeColor;
  final Color? inactiveColor;
  final String? id;
  final String? title;
  final int? duration;
  final String? image;
  final String? audioPath;

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  late AssetsAudioPlayer _audioPlayer;
  Duration? _duration = Duration.zero;
  Duration? _position = Duration.zero;
  StreamSubscription? _positionSubscription;
  StreamSubscription? _playingSubsciption;

  Duration currentPosition(RealtimePlayingInfos infos) => infos.currentPosition;
  Duration duration(RealtimePlayingInfos infos) => infos.duration;
  MeditationAudioStruct? downloadedTrack;

  @override
  void initState() {
    super.initState();
    downloadedTrack = findTrackById(widget.id!, FFAppState().downloadedTracks);
    _initPlayer();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    print("dispose");
    _audioPlayer.dispose();
    _positionSubscription?.cancel();
    _playingSubsciption?.cancel();
    super.dispose();
  }

  Future _createMetas() async {
    Metas met = Metas(
        id: widget.id,
        title: widget.title,
        image: downloadedTrack != null &&
                File(downloadedTrack!.localAudioPath).existsSync()
            ? MetasImage.file(downloadedTrack!.localImagePath)
            : MetasImage.network(widget.image!));

    return met;
  }

  Future _playerStart(Metas metas) async {
    if (downloadedTrack != null &&
        downloadedTrack!.localAudioPath.isNotEmpty &&
        File(downloadedTrack!.localAudioPath).existsSync()) {
      FFAppState().currentTrackId = widget.id!;
      try {
        await _audioPlayer.open(
          Audio.file(
            downloadedTrack!.localAudioPath,
            metas: metas,
          ),
          showNotification: !Platform.isAndroid,
          autoStart: false,
          playInBackground: PlayInBackground.enabled,
          audioFocusStrategy: AudioFocusStrategy.request(
              resumeAfterInterruption: true,
              resumeOthersPlayersAfterDone: true),
          headPhoneStrategy: HeadPhoneStrategy.pauseOnUnplug,
          notificationSettings: NotificationSettings(
              playPauseEnabled: true,
              prevEnabled: false,
              nextEnabled: false,
              stopEnabled: true,
              seekBarEnabled: true,
              //customStopAction: (player){
              //  player.stop();
              //}

              customPlayPauseAction: (player) async {
                FFAppState().update(
                  () {
                    FFAppState().isAudioPlaying =
                        !player.realtimePlayingInfos.value.isPlaying;
                  },
                );
                await playOrPause(widget.playId!);
              }),
        );

        if (FFAppState().repeatMode) {
          _audioPlayer.setLoopMode(LoopMode.single);
        } else {
          _audioPlayer.setLoopMode(LoopMode.none);
        }
      } catch (e) {
        print(e);
      }
    } else {
      try {
        await _audioPlayer.open(
          Audio.network(
            widget.audioPath!,
            metas: metas,
          ),
          showNotification: !Platform.isAndroid,
          autoStart: false,
          seek: Duration(milliseconds: FFAppState().positionMS),
          playInBackground: PlayInBackground.enabled,
          audioFocusStrategy: AudioFocusStrategy.request(
              resumeAfterInterruption: true,
              resumeOthersPlayersAfterDone: true),
          headPhoneStrategy: HeadPhoneStrategy.pauseOnUnplug,
          notificationSettings: NotificationSettings(
              playPauseEnabled: true,
              prevEnabled: false,
              nextEnabled: false,
              stopEnabled: true,
              seekBarEnabled: true,
              //customStopAction: (player){
              //  player.stop();
              //}

              customPlayPauseAction: (player) async {
                FFAppState().update(
                  () {
                    FFAppState().isAudioPlaying =
                        !player.realtimePlayingInfos.value.isPlaying;
                  },
                );
                await playOrPause(widget.playId!);
              }),
        );
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_audioPlayer.current.hasValue) {
      setState(() {});
    }
    return Slider(
      activeColor: widget.activeColor,
      inactiveColor: widget.inactiveColor,
      onChanged: (v) {
        final duration = _duration;
        if (duration == null) {
          print("duration null");
          return;
        }
        final position = v * duration.inMilliseconds;

        _audioPlayer.seek(Duration(milliseconds: position.round()));
        setState(() {
          _position = Duration(milliseconds: position.round());
        });
      },
      value: (_position != null &&
              _duration != null &&
              _duration != Duration.zero &&
              _position!.inMilliseconds > 0 &&
              _position!.inMilliseconds < _duration!.inMilliseconds)
          ? _position!.inMilliseconds / _duration!.inMilliseconds
          : 0.0,
    );
  }

  void _initStreams() {
    _playingSubsciption = _audioPlayer.isPlaying.listen((data) {
      if (FFAppState().isAudioPlaying != data) {
        FFAppState().update(() {
          FFAppState().isAudioPlaying = data;
        });
      }
    });
    _positionSubscription = _audioPlayer.currentPosition.listen((p) {
      if (_audioPlayer.current.hasValue) {
        FFAppState().update(() {
          FFAppState().positionMS = p.inMilliseconds;

          FFAppState().durationMS = _duration!.inMilliseconds;
        });

        setState(() {
          _position = p;
          _duration = _audioPlayer.current.value!.audio.duration;
        });

        if (FFAppState().durationMS != _duration!.inMilliseconds) {
          FFAppState().update(() {
            FFAppState().positionMS = p.inMilliseconds;

            FFAppState().durationMS = _duration!.inMilliseconds;
          });
        }
      }
    });
  }

  Future _initPlayer() async {
    _audioPlayer = AssetsAudioPlayer.withId(widget.playId);
    if (FFAppState().currentTrackId != widget.id) {
      _playerStart(await _createMetas());
      FFAppState().currentTrackId = widget.id!;
    }
    _initStreams();

    if (_audioPlayer.current.hasValue) {
      Duration dur = _audioPlayer.current.value!.audio.duration;
      setState(() => _duration = dur);
    }
  }
}

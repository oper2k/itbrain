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

//Работает в паре с виджетом NewPlayer. Качает аудио в кеш. Айди медитации - линк на медитацию
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class DownloadWidget extends StatefulWidget {
  const DownloadWidget({
    Key? key,
    this.url,
    this.width,
    this.height,
    required this.downloadOn,
    required this.downloadOff,
    this.colorPrimary,
    this.colorSecondary,
    required this.finishDownload,
  }) : super(key: key);

  final String? url;
  final double? width;
  final double? height;
  final Widget downloadOn;
  final Widget downloadOff;
  final Color? colorPrimary;
  final void Function() finishDownload;
  final Color? colorSecondary;
  @override
  State<DownloadWidget> createState() => _DownloadWidgetState();
}

class _DownloadWidgetState extends State<DownloadWidget> {
  DownloadState downloadState = DownloadState.inactive;
  Stream<FileResponse>? fileStream;

  Future<bool> getLocalUrlIfExist() async {
    FileInfo? file = await DefaultCacheManager().getFileFromCache(widget.url!);
    return file != null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: getLocalUrlIfExist(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return widget.downloadOff!;
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return widget.downloadOff!;
          } else if (snapshot.hasData) {
            if (snapshot.data!) {
              return widget.downloadOn!;
            }
            return GestureDetector(
              onTap: () {
                if (downloadState == DownloadState.downloaded ||
                    downloadState == DownloadState.inprogress) return;
                setState(() {
                  downloadState = DownloadState.inprogress;
                  fileStream = DefaultCacheManager()
                      .getFileStream(widget.url!, withProgress: true)
                      .asBroadcastStream();
                });
              },
              child: downloadState == DownloadState.inactive
                  ? widget.downloadOff
                  : _buildStream(),
            );
          } else {
            return widget.downloadOff!;
          }
        } else {
          return widget.downloadOff!;
        }
      },
    );
  }

  Widget _buildStream() {
    return StreamBuilder<FileResponse>(
      stream: fileStream,
      builder: (context, snapshot) {
        Widget? body;
        var loading = !snapshot.hasData || snapshot.data is DownloadProgress;
        if (snapshot.hasError) {
          fileStream = null;
          downloadState = DownloadState.inactive;
          body = GestureDetector(
            onTap: () {
              if (downloadState == DownloadState.downloaded ||
                  downloadState == DownloadState.inprogress) return;
              setState(() {
                downloadState = DownloadState.inprogress;
                fileStream = DefaultCacheManager()
                    .getFileStream(widget.url!, withProgress: true)
                    .asBroadcastStream();
              });
            },
            child: _buildStream(),
          );
        } else if (loading) {
          body = SizedBox(
            width: widget.width,
            height: widget.height,
            child: Stack(
              alignment: Alignment.center,
              children: [
                widget.downloadOff!,
                CircularProgressIndicator(
                    backgroundColor: widget.colorSecondary ??
                        const Color.fromARGB(255, 255, 0, 0).withOpacity(0.2),
                    color: widget.colorPrimary ??
                        const Color.fromARGB(255, 255, 0, 0),
                    value: snapshot.data != null
                        ? (snapshot.data as DownloadProgress).progress
                        : 0),
              ],
            ),
          );
        } else {
          fileStream = null;
          downloadState = DownloadState.downloaded;
          body = widget.downloadOn;
          widget.finishDownload();
        }
        return body!;
      },
    );
  }
}

enum DownloadState { inactive, inprogress, downloaded }

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!

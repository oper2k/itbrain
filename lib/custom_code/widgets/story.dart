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

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'package:story/story.dart';
import 'package:video_player/video_player.dart';
import '../../backend/schema/stories_record.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Story extends StatefulWidget {
  const Story({
    Key? key,
    this.width,
    this.height,
    required this.initialPage,
    this.onUserChanged,
    this.allStories,
    this.color,
    this.image,
  }) : super(key: key);

  final double? width;
  final double? height;
  final int initialPage;
  final Future<dynamic> Function()? onUserChanged;
  final List<StoriesRecord>? allStories;
  final Color? color;
  final String? image;

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  late ValueNotifier<IndicatorAnimationCommand> _indicatorAnimationController;

  List<UserModel> _sampleUsers = [];
  bool _isVideo = false;

  @override
  void initState() {
    _indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(
      IndicatorAnimationCommand.resume,
    );
    _sampleUsers = widget.allStories!
        .map(
          (story) => UserModel(
            story.contentStories
                .map((storyContent) =>
                    StoryModel(storyContent.image, storyContent.video))
                .toList(),
            story.title,
            story.image,
          ),
        )
        .toList();
    super.initState();
  }

  @override
  void dispose() {
    _indicatorAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      // body: SafeArea(
      child: StoryPageView(
        indicatorPadding:
            const EdgeInsets.symmetric(vertical: 50, horizontal: 5),
        indicatorAnimationController: _indicatorAnimationController,
        initialPage: widget.initialPage,
        onPageChanged: (index) {
          setState(() {
            FFAppState().currentStory = widget.allStories![index - 1].reference;
          });
          widget.onUserChanged?.call();
        },
        itemBuilder: (context, pageIndex, storyIndex) {
          final user = _sampleUsers[pageIndex];
          final story = user.stories[storyIndex];
          _isVideo = story.videoUrl != null && story.videoUrl!.isNotEmpty;
          if (_isVideo) {
            _indicatorAnimationController.value =
                IndicatorAnimationCommand.pause;
          }
          return Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.color,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(widget.image ?? ''),
                    ),
                  ),
                ),
              ),
              _isVideo
                  ? StoryVideoPlayer(
                      videoUrl: story.videoUrl ?? '',
                      onInitialized: () {
                        _indicatorAnimationController.value =
                            IndicatorAnimationCommand.resume;
                      },
                    )
                  : StoryImage(
                      //color: Color(0xFF003CFF),
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      key: ValueKey(story.imageUrl),
                      imageProvider: NetworkImage(
                        story.imageUrl!,
                      ),
                      fit: BoxFit.cover,
                    ),
              Padding(
                padding: const EdgeInsets.only(top: 70, left: 8),
                child: Row(
                  children: [
                    Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(user.imageUrl),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      user.userName,
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        gestureItemBuilder: (context, pageIndex, storyIndex) {
          return Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: IconButton(
                padding: EdgeInsets.zero,
                color: Colors.white,
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          );
        },
        pageLength: _sampleUsers.length,
        storyLength: (int pageIndex) {
          return _sampleUsers[pageIndex].stories.length;
        },
        onPageLimitReached: () {
          setState(() {
            FFAppState().currentStory = widget.allStories!.last.reference;
          });
          widget.onUserChanged?.call();
          Navigator.pop(context);
        },
      ),
    );
    // );
  }
}

class UserModel {
  UserModel(
    this.stories,
    this.userName,
    this.imageUrl,
  );
  final List<StoryModel> stories;
  final String userName;
  final String imageUrl;
}

class StoryModel {
  StoryModel(this.imageUrl, this.videoUrl);

  final String? imageUrl;
  final String? videoUrl;
}

class StoryVideoPlayer extends StatefulWidget {
  final VoidCallback onInitialized;
  const StoryVideoPlayer({
    Key? key,
    required this.videoUrl,
    required this.onInitialized,
  }) : super(key: key);
  final String videoUrl;

  @override
  _StoryVideoPlayerState createState() => _StoryVideoPlayerState();
}

class _StoryVideoPlayerState extends State<StoryVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        widget.onInitialized();
        setState(() {});
      });
    _controller.play();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Visibility(
        visible: _controller.value.isInitialized,
        replacement: CircularProgressIndicator(
          color: Colors.white,
        ),
        child: SizedBox.expand(
          child: FittedBox(
            alignment: Alignment.center,
            fit: BoxFit.fitHeight,
            child: SizedBox.fromSize(
              size: _controller.value.size,
              child: VideoPlayer(_controller),
            ),
          ),
        ),
      ),
    );
  }
}

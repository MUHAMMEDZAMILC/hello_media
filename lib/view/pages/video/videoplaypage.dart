import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_media/utils/helper/help_screensize.dart';
import 'package:hello_media/utils/theme/colors.dart';
import 'package:hello_media/utils/theme/dimensions.dart';
import 'package:hello_media/utils/theme/theme_data.dart';
import 'package:hello_media/view/components/apptext.dart';
import 'package:video_player/video_player.dart';

class VideoPlayScreen extends StatefulWidget {
   VideoPlayScreen({super.key,required this.videourl});
  String videourl;
  @override
  State<VideoPlayScreen> createState() => _VideoPlayScreenState();
}

class _VideoPlayScreenState extends State<VideoPlayScreen> {
  late VideoPlayerController controller;
  @override
  void initState() {
    controller = VideoPlayerController.networkUrl(Uri.parse(
        widget.videourl),videoPlayerOptions: VideoPlayerOptions())
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: ColorResources.TRANSPARENT,
        surfaceTintColor: ColorResources.TRANSPARENT,
      ),
      body: SizedBox(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        child: controller.value.isInitialized
              ? Stack(
                alignment: Alignment.bottomCenter,
                // fit: StackFit.expand,
                children: [
                  // AspectRatio(
                    // aspectRatio: controller.value.aspectRatio,
                    // child: 
                    VideoPlayer(controller),
                    // ),
                    _ControlsOverlay(controller: controller)
            
                ],
              )
              : Container(),
      ),
      
      
    );
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class _ControlsOverlay extends StatefulWidget {
  const _ControlsOverlay({required this.controller});

  static const List<Duration> _exampleCaptionOffsets = <Duration>[
    Duration(seconds: -10),
    Duration(seconds: -3),
    Duration(seconds: -1, milliseconds: -500),
    Duration(milliseconds: -250),
    Duration.zero,
    Duration(milliseconds: 250),
    Duration(seconds: 1, milliseconds: 500),
    Duration(seconds: 3),
    Duration(seconds: 10),
  ];
  static const List<double> _examplePlaybackRates = <double>[
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  final VideoPlayerController controller;

  @override
  State<_ControlsOverlay> createState() => _ControlsOverlayState();
}

class _ControlsOverlayState extends State<_ControlsOverlay> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Stack(
        children: <Widget>[
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 50),
            reverseDuration: const Duration(milliseconds: 200),
            child: widget.controller.value.isPlaying
                ? const Center(
                  child: Icon(
                    Icons.pause,
                    color: primarycolor,
                    size: 50.0,
                    semanticLabel: 'Pause',
                  ),
                )
                : const Center(
                  child: Icon(
                    Icons.play_arrow,
                    color: primarycolor,
                    size: 50.0,
                    semanticLabel: 'Play',
                  ),
                ),
          ),
          GestureDetector(
            onTap: () {
              widget.controller.value.isPlaying ? widget.controller.pause() : widget.controller.play();
      setState(() {
        
      });
            },
          ),
          Align(
            alignment: Alignment.topLeft,
            child: PopupMenuButton<Duration>(
              initialValue: widget.controller.value.captionOffset,
              tooltip: 'Caption Offset',
              onSelected: (Duration delay) {
                widget.controller.setCaptionOffset(delay);
              },
              itemBuilder: (BuildContext context) {
                return <PopupMenuItem<Duration>>[
                  for (final Duration offsetDuration in _ControlsOverlay._exampleCaptionOffsets)
                    PopupMenuItem<Duration>(
                      value: offsetDuration,
                      child: AppText( text: '${offsetDuration.inMilliseconds}ms',color: primarycolor,),
                    )
                ];
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  // Using less vertical padding as the text is also longer
                  // horizontally, so it feels like it would need more spacing
                  // horizontally (matching the aspect ratio of the video).
                  vertical: 12,
                  horizontal: 16,
                ),
                child: AppText(text: '${widget.controller.value.captionOffset.inMilliseconds}ms',color: primarycolor,),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: PopupMenuButton<double>(
              initialValue: widget.controller.value.playbackSpeed,
              tooltip: 'Playback speed',
              onSelected: (double speed) {
                widget.controller.setPlaybackSpeed(speed);
              },
              itemBuilder: (BuildContext context) {
                return <PopupMenuItem<double>>[
                  for (final double speed in _ControlsOverlay._examplePlaybackRates)
                    PopupMenuItem<double>(
                      value: speed,
                      child: AppText(text: '${speed}x',color: primarycolor,),
                    )
                ];
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  // Using less vertical padding as the text is also longer
                  // horizontally, so it feels like it would need more spacing
                  // horizontally (matching the aspect ratio of the video).
                  vertical: 12,
                  horizontal: 16,
                ),
                child: AppText(text:  '${widget.controller.value.playbackSpeed}x',color: primarycolor,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
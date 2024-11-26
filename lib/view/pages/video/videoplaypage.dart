import 'package:flutter/material.dart';
import 'package:hello_media/utils/helper/help_screensize.dart';
import 'package:hello_media/utils/theme/colors.dart';
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
      appBar: AppBar(
        backgroundColor: ColorResources.TRANSPARENT,
        surfaceTintColor: ColorResources.TRANSPARENT,
      ),
      body: SizedBox(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        child: controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: controller.value.aspectRatio,
                  child: VideoPlayer(controller),
                )
              : Container(),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              controller.value.isPlaying
                  ? controller.pause()
                  : controller.play();
            });
          },
          child: Icon(
            controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      
    );
  }
}
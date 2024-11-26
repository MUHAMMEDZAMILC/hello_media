import 'package:flutter/material.dart';
import 'package:hello_media/utils/extension/space_ext.dart';
import 'package:video_player/video_player.dart';

import '../../../../model/homemodel.dart';
import '../../../../utils/helper/help_screensize.dart';
import '../../../../utils/string.dart';
import '../../../../utils/theme/colors.dart';
import '../../../../utils/theme/dimensions.dart';
import '../../../../utils/theme/theme_data.dart';
import '../../../components/apprichtext.dart';
import '../../../components/appsvg.dart';
import '../../../components/apptext.dart';

class HomeCard extends StatefulWidget {
  const HomeCard({
    super.key,
    required this.data,
  });

  final Result data;

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  late VideoPlayerController controller;
  void initState() {
    controller = VideoPlayerController.networkUrl(Uri.parse(
        widget.data.video??''),)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: paddingTiny),
      child: SizedBox(
        width: ScreenUtil.screenWidth,
        child: Column(
          children: [
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(paddingLarge),
                child: Row(
                  children: [
                     CircleAvatar(backgroundImage:widget.data.user?.image==null?null: NetworkImage(widget.data.user?.image),),
                    gapHorizontal,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(text: widget.data.user?.name??'',weight: FontWeight.w500,size: 13,color: ColorResources.WHITE,),
                        gap,
                        AppText(text: '15 days ago',weight: FontWeight.w400,size: 10,color: ColorResources.GREYTEXT,)
                      ],
                    )
                  ],
                ),
              ),
            ),
             AspectRatio(
              aspectRatio: 16/9,
               child: Stack(
                alignment: Alignment.center,
                 children: [
                   VideoPlayer(controller),
                  IconButton(onPressed: () {
                     controller.value.isPlaying ? controller.pause() : controller.play();
      setState(() {
        
      });
                  }, icon: controller.value.isPlaying==false?Center(child: AppSvg(assetName: playbtnicon)):const Icon(Icons.pause,color: ColorResources.WHITE,))
                          //  ControlsOverlay(controller: controller,)
                 ,  controller.value.isPlaying?       Positioned(
                  bottom: 0,
                   child: SizedBox(
                    width: ScreenUtil.screenWidth,
                     child: Slider(
                      thumbColor: primarycolor,
                      activeColor: primarycolor,
                                 value: controller.value.isInitialized
                                     ? controller.value.position.inSeconds.toDouble()
                                     : 0.0,
                                 max: controller.value.isInitialized
                                     ? controller.value.duration.inSeconds.toDouble()
                                     : 1.0,
                                 onChanged: (value) async {
                                  await seekToPosition(Duration(seconds: value.toInt()));

                                   

                                 },
                               ),
                   ),
                 ):0.hBox,
                 ],
               ),
             ),
            // InkWell(
            //   onTap: () {
            //     if (data.video!=null && data.video!='') {
            //       Screen.open(context, VideoPlayScreen(videourl: data.video??''));
            //     }
            //   },
              
            //   child: Container(
                
            //     width: ScreenUtil.screenWidth,
            //     height: ScreenUtil.screenHeight!*0.3,
            //     decoration: BoxDecoration(
            //       color: ColorResources.SCAFFOLDBG,
            //       image:data.image==null?null: DecorationImage(image: NetworkImage(data.image??''),fit: BoxFit.cover)
            //     ),
            //     child: Center(child: AppSvg(assetName: playbtnicon)),
            //   ),
            // ),
             SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(paddingLarge),
                child:  Row(
                  children: [
                    AppRichText(normalText: widget.data.description??'',richText: ' See More',richTextColor: ColorResources.WHITE,normalTextColor: ColorResources.GREYTEXT2,normalFontWeight: FontWeight.w300,fontSize: 12.5,richFontWeight: FontWeight.w500,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  seekToPosition(Duration position) {
   
    setState(() {
       controller.seekTo(position);
        controller.play();
    });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
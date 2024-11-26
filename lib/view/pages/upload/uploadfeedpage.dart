import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_media/utils/helper/help_screensize.dart';
import 'package:hello_media/utils/helper/pagenavigator.dart';
import 'package:hello_media/utils/theme/colors.dart';
import 'package:hello_media/utils/theme/dimensions.dart';
import 'package:hello_media/utils/theme/theme_data.dart';
import 'package:hello_media/view/components/appsvg.dart';
import 'package:hello_media/view/components/apptext.dart';

import '../../../utils/string.dart';

class UploadFeedScreen extends StatefulWidget {
  const UploadFeedScreen({super.key});

  @override
  State<UploadFeedScreen> createState() => _UploadFeedScreenState();
}

class _UploadFeedScreenState extends State<UploadFeedScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Screen.close(context);
        }, icon:AppSvg(assetName: leftroundedarrowsvg)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(text: 'Add Feed',color: ColorResources.WHITE,size: 16,weight: FontWeight.w500,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.3),
                color: primarycolor.withOpacity(0.06),
                border: Border.all(color: primarycolor.withOpacity(0.4),width: 0.84)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: padding,horizontal: paddingLarge),
                child: AppText(text: 'Share Feed',weight: FontWeight.w400,size: 13,color: ColorResources.WHITE,),
              ),
            )
          ],
        ),
      ),
      body: SizedBox(width: ScreenUtil.screenWidth,height: ScreenUtil.screenHeight,
      child: Padding(
        padding: const EdgeInsets.all(paddingLarge),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DottedBorder(
                borderType: BorderType.RRect,
             radius: const Radius.circular(10.48),
             dashPattern: const [10, 10],
             color: ColorResources.WHITE.withOpacity(0.8),
             strokeWidth: 0.34,
                child:SizedBox(
                width: ScreenUtil.screenWidth,
                height: ScreenUtil.screenHeight!*0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppSvg(assetName: uploadvideoic),
                    gap,
                    AppText(text: 'Select a Video From Gallery',weight: FontWeight.w400,size: 15,color: ColorResources.WHITE,)
                  ],
                ),
              ) ),
              gap26,
              DottedBorder(
                borderType: BorderType.RRect,
             radius: const Radius.circular(10.48),
             dashPattern: const [10, 10],
             color: ColorResources.WHITE.withOpacity(0.8),
             strokeWidth: 0.34,
                child:SizedBox(
                width: ScreenUtil.screenWidth,
                height: ScreenUtil.screenHeight!*0.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppSvg(assetName: uploadimgic),
                    gapHorizontalLarge,
                    AppText(text: 'Add a Thumbnail',weight: FontWeight.w400,size: 15,color: ColorResources.WHITE,)
                  ],
                ),
              ) ),
              gap26,
              AppText(text: 'Add Description',weight: FontWeight.w500,color: ColorResources.WHITE.withOpacity(0.9),size: 14,),
              gap,
              AppText(text: 'Lorem ipsum dolor sit amet consectetur. Leo ac lorem faucli bus facilisis tellus. At vitae dis commodo nunc sollicitudin elementum suspendisse...Lorem ipsum dolor sit amet consectetur. Leo ac lorem faucli bus facilisis tellus. At vitae dis commodo nunc sollicitudin elementum suspendisse...',weight: FontWeight.w300,size: 11,color: ColorResources.WHITE.withOpacity(0.6),),
              gap26,
              AppText(text: 'Categories This Project',weight: FontWeight.w500,color: ColorResources.WHITE.withOpacity(0.9),size: 14,),
              gap,
              GridView.builder(
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: 1/0.3,crossAxisSpacing: padding,mainAxisSpacing: padding),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17.3),
                  color: primarycolor.withOpacity(0.06),
                  border: Border.all(color: primarycolor.withOpacity(0.4),width: 0.84)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: padding,horizontal: paddingLarge),
                  child: AppText(text: 'Share Feed',weight: FontWeight.w400,size: 13,color: ColorResources.WHITE,),
                ),
              );
              },)
              
          
            ],
          ),
        ),
      ),),
    );
  }
}
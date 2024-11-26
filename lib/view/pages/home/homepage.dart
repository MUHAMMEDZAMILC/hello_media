import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_media/utils/helper/help_screensize.dart';
import 'package:hello_media/utils/helper/pagenavigator.dart';
import 'package:hello_media/utils/theme/colors.dart';
import 'package:hello_media/utils/theme/dimensions.dart';
import 'package:hello_media/utils/theme/theme_data.dart';
import 'package:hello_media/view/components/apprichtext.dart';
import 'package:hello_media/view/components/apptext.dart';
import 'package:hello_media/view/pages/upload/uploadfeedpage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(text: 'Welcome To MZ',color: ColorResources.WHITE,weight: FontWeight.w600,size: 16,),
                  gap,
                  AppText(text: 'Welcome back to section',size: 13,weight: FontWeight.w400,color: ColorResources.WHITE,)
                ],
              ),
              const CircleAvatar()
            ],
          ),
        ),
        bottom: PreferredSize(preferredSize: Size(ScreenUtil.screenWidth!, 50), child: SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: paddingSmall),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.5),
                  border: Border.all(color: ColorResources.WHITE.withOpacity(0.4),width: .84),
                  
                ),
                child: Center(child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: paddingLarge),
                  child: AppText(text: 'Trending',weight: FontWeight.w400,size: 12,color: ColorResources.WHITE,),
                )),
              ),
            );
          },),
        )),
        
      ),
      body: SizedBox(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        child: ListView.builder(itemBuilder: (context, index) {
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
                          const CircleAvatar(),
                          gapHorizontal,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(text: 'Gokul Krishna',weight: FontWeight.w500,size: 13,color: ColorResources.WHITE,),
                              gap,
                              AppText(text: '15 days ago',weight: FontWeight.w400,size: 10,color: ColorResources.GREYTEXT,)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: ColorResources.WHITE,
                    width: ScreenUtil.screenWidth,
                    height: ScreenUtil.screenHeight!*0.3,
                    // child: ,
                  ),
                  const SizedBox(
                    child: Padding(
                      padding: EdgeInsets.all(paddingLarge),
                      child:  AppRichText(normalText: 'Lorem ipsum dolor sit amet consectetur. Leo ac lorem faucli bus facilisis tellus. At vitae dis commodo nunc sollicitudin elementum suspendisse...',richText: 'See More',richTextColor: ColorResources.WHITE,normalTextColor: ColorResources.GREYTEXT2,normalFontWeight: FontWeight.w300,fontSize: 12.5,richFontWeight: FontWeight.w500,),
                    ),
                  ),
                ],
              ),
            ),
          );
        },)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        Screen.open(context, const UploadFeedScreen());
      },backgroundColor: primarycolor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(53.1),),child: const Icon(CupertinoIcons.add,color: ColorResources.WHITE,size: 35,),),
    );
  }
}
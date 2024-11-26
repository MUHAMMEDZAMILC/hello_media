import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_media/controller/provider/provideroperation.dart';
import 'package:hello_media/utils/helper/help_loader.dart';
import 'package:hello_media/utils/helper/help_screensize.dart';
import 'package:hello_media/utils/helper/pagenavigator.dart';
import 'package:hello_media/utils/string.dart';
import 'package:hello_media/utils/theme/colors.dart';
import 'package:hello_media/utils/theme/dimensions.dart';
import 'package:hello_media/utils/theme/theme_data.dart';
import 'package:hello_media/view/components/apprichtext.dart';
import 'package:hello_media/view/components/appsvg.dart';
import 'package:hello_media/view/components/apptext.dart';
import 'package:hello_media/view/pages/upload/uploadfeedpage.dart';
import 'package:hello_media/view/pages/video/videoplaypage.dart';
import 'package:provider/provider.dart';

import '../../../model/homemodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<ProviderOperation>(context,listen: false).gethomecontent(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final service =  Provider.of<ProviderOperation>(context,listen: false);
    final liveservice = Provider.of<ProviderOperation>(context,listen: true);
    ScreenUtil.init(context);
    return liveservice.ispageloading?const PageEntryLoader(): Scaffold(
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: paddingSmall),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.5),
                        border: Border.all(color: primarycolor.withOpacity(0.4),width: .84),
                        color: primarycolor.withOpacity(0.1)
                      ),
                      child: Center(child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: paddingLarge),
                        child: AppText(text: 'Explore',weight: FontWeight.w400,size: 12,color: ColorResources.WHITE,),
                      )),
                    ),
                  ),
                  const VerticalDivider( thickness: 0.42,color: ColorResources.GREYDICIDER,endIndent: 8,indent: 8,),
              SizedBox(
                width: ScreenUtil.screenWidth!*0.7,
                child: ListView.builder(
                  itemCount: liveservice.homedata.categoryDict?.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    CategoryDict data = liveservice.homedata.categoryDict![index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: paddingSmall),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.5),
                        border: Border.all(color: ColorResources.WHITE.withOpacity(0.4),width: .84),
                        
                      ),
                      child: Center(child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: paddingLarge),
                        child: AppText(text: data.title??'',weight: FontWeight.w400,size: 12,color: ColorResources.WHITE,),
                      )),
                    ),
                  );
                },),
              ),
            ],
          ),
        )),
        
      ),
      body: SizedBox(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        child: ListView.builder(
          itemCount: liveservice.homedata.results?.length,
          itemBuilder: (context, index) {
            Result data = liveservice.homedata.results![index];
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
                           CircleAvatar(backgroundImage:data.user?.image==null?null: NetworkImage(data.user?.image),),
                          gapHorizontal,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(text: data.user?.name??'',weight: FontWeight.w500,size: 13,color: ColorResources.WHITE,),
                              gap,
                              AppText(text: '15 days ago',weight: FontWeight.w400,size: 10,color: ColorResources.GREYTEXT,)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (data.video!=null && data.video!='') {
                        Screen.open(context, VideoPlayScreen(videourl: data.video??''));
                      }
                    },
                    child: Container(
                      
                      width: ScreenUtil.screenWidth,
                      height: ScreenUtil.screenHeight!*0.3,
                      decoration: BoxDecoration(
                        color: ColorResources.SCAFFOLDBG,
                        image:data.image==null?null: DecorationImage(image: NetworkImage(data.image??''),fit: BoxFit.cover)
                      ),
                      child: Center(child: AppSvg(assetName: playbtnicon)),
                    ),
                  ),
                   SizedBox(
                    child: Padding(
                      padding: EdgeInsets.all(paddingLarge),
                      child:  Row(
                        children: [
                          AppRichText(normalText: data.description??'',richText: ' See More',richTextColor: ColorResources.WHITE,normalTextColor: ColorResources.GREYTEXT2,normalFontWeight: FontWeight.w300,fontSize: 12.5,richFontWeight: FontWeight.w500,),
                        ],
                      ),
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
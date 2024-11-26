// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hello_media/controller/shared_pref.dart';
import 'package:hello_media/utils/helper/help_screensize.dart';
import 'package:hello_media/utils/helper/pagenavigator.dart';
import 'package:hello_media/utils/string.dart';
import 'package:hello_media/utils/theme/theme_data.dart';
import 'package:hello_media/view/components/apptext.dart';
import 'package:hello_media/view/pages/auth/otpverificationpage.dart';
import 'package:hello_media/view/pages/home/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () async{
      String? acctoken = await SharedPref.getstring(accesskey);
      if (acctoken!=null && acctoken !='') {
        acctoken = acctoken;
        Screen.openAsNewPage(context, const HomeScreen());
      }else{
 Screen.openAsNewPage(context, const OtpVerifyScreen());
      }
     
    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: SizedBox(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        child: Center(
          child: AppText(text: 'Hello Media',color: primarycolor,weight: FontWeight.w500,letterspace: 0.5,size: 25,),
        ),
      ),
    );
  }
}
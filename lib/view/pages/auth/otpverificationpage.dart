import 'package:flutter/material.dart';
import 'package:hello_media/utils/helper/help_screensize.dart';
import 'package:hello_media/utils/helper/pagenavigator.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: SizedBox(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        child: Column(
          children: [
            
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/colors.dart';
import '../theme/theme_data.dart';
import 'help_screensize.dart';


bool isLoading = false;


const bgColorLoader = Color(0x0c8e8e8e);

 Dialog _alert = Dialog(
    backgroundColor: bgColorLoader,
    insetPadding: const EdgeInsets.all(0),
    child: Center(child: Container(width: 80,height: 80,decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: ColorResources.WHITE),child: const Center(child: CircularProgressIndicator(color: primarycolor,),),)));

loader({required BuildContext context}) {
  if (isLoading) {
    return;
  }

  isLoading = true;

  try {
    hideKeyboard;
  } catch (_) {
    debugPrint("ERRROR ON SNACKBAR");
  }

  try {
    showDialog(
      barrierDismissible: false,
      context: context,
      useSafeArea: false,
      builder: (BuildContext context) {
        return  AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(statusBarColor: bgColorLoader),
          child: _alert,
        );
      },
    );
  } catch (e) {
    debugPrint("ERRROR ON POPUP:$e");
  }
}

hideLoader(BuildContext context) {
  if (isLoading) {
    isLoading = false;
    Navigator.pop(context);
  }
}

class MyAppLoader extends StatelessWidget {
  const MyAppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SizedBox(
            width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight!*0.9,
            child: Center(child: Container(width: 80,height: 80,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: ColorResources.WHITE,boxShadow: [BoxShadow(color: ColorResources.BLACK.withOpacity(0.4),blurStyle: BlurStyle.outer,blurRadius: 5)]),child: const Center(child: CircularProgressIndicator(),),))
          );
  }
}

class PageEntryLoader extends StatelessWidget {
  const PageEntryLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: ScreenUtil.screenWidth,
      height: ScreenUtil.screenHeight,
      color: ColorResources.SCAFFOLDBG,
      child: const Center(
        child: CircularProgressIndicator(color: primarycolor,),
      ),
    );
  }
}

void get hideKeyboard => FocusManager.instance.primaryFocus?.unfocus();
// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_media/utils/extension/space_ext.dart';
import 'package:hello_media/view/components/apptext.dart';

import '../../utils/helper/help_screensize.dart';
import '../../utils/theme/colors.dart';
import '../../utils/theme/theme_data.dart';

class AppButton extends StatelessWidget {
  AppButton(
      {super.key,
      this.child,
      required this.onPressed,
      required this.isValid,
      this.btncolor,
      this.textcolor,
      this.buttonStyle,
      this.isLoading=true,
      this.height,this.width,this.isBorderradius=false});
  Widget? child;
  Color? btncolor, textcolor;
  Function() onPressed;
  ButtonStyle? buttonStyle;
  double? height,width;
  bool isValid,isLoading;
  bool? isBorderradius = false;
  
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SizedBox(
        width:width?? ScreenUtil.screenWidth,
        height: height ?? 45,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ElevatedButton(
              
                style: buttonStyle ??
                    ButtonStyle(
                      elevation: const WidgetStatePropertyAll(6),
                        padding:
                            const WidgetStatePropertyAll(EdgeInsets.zero),
                        backgroundColor: WidgetStatePropertyAll(
                            btncolor ?? secondarycolor),
                        shadowColor:  WidgetStatePropertyAll(
                            secondarycolor.withOpacity(0.4)),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ))),
                onPressed: onPressed,
                child: child ??
                    AppText(
                      text: '',
                      color: textcolor ?? ColorResources.WHITE,
                      size: 17,
                      letterspace: 0.1,
                      weight: FontWeight.w600,
                    )),
            isValid == true
                ? 0.hBox
                : ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          ColorResources.GREY.withOpacity(0.5),
                        ),
                        shadowColor: const WidgetStatePropertyAll(
                            ColorResources.TRANSPARENT), shape:isBorderradius==false? WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        )):null),
                    onPressed: () {},
                    child: AppText(text: '')),
            isLoading == true
                ? 0.hBox
                : ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          ColorResources.GREY.withOpacity(0.8),
                        ),
                        shadowColor: const WidgetStatePropertyAll(
                            ColorResources.TRANSPARENT), shape:isBorderradius==false? WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        )):null),
                    onPressed: () {},
                    child: const CupertinoActivityIndicator(color: ColorResources.WHITE,radius: 8,)),
          ],
        ));
  }
}

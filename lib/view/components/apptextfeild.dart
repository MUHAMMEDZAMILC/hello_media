
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_media/utils/extension/space_ext.dart';
import 'package:hello_media/utils/extension/upperfstring_ext.dart';
import 'package:hello_media/view/components/apptext.dart';
import '../../utils/helper/help_screensize.dart';
import '../../utils/theme/colors.dart';
import '../../utils/theme/dimensions.dart';
import '../../utils/theme/theme_data.dart';

// ignore: must_be_immutable
class AppTextFeild extends StatelessWidget {
  AppTextFeild(
      {super.key,
      required this.controller,
      this.label,
      this.hinttext,
      this.isobsecure,
      this.type,
      this.height,
      this.width,
      this.vcontentpadding,
      this.prefix,
      this.suffix,
      this.readonly,
      this.onTap,
      this.onChanged,
      this.contentalign,
      this.borderstyle,
      this.filledcolor,
      this.hintStyle,
      this.textstyle,
      this.labelshow,this.digitsonly,this.multiline,this.isrequired=false});
  TextEditingController controller;
  String? label, hinttext;
  TextInputType? type;
  TextStyle? textstyle, hintStyle;
  bool? isobsecure, readonly, labelshow,digitsonly,isrequired;
  Widget? suffix, prefix;
  double? height, width,vcontentpadding;
  int? multiline;
  Color? filledcolor;
  TextAlign? contentalign;
  OutlineInputBorder? borderstyle;
  Function()? onTap;
  Function(String value)? onChanged;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SizedBox(
      width: width ?? ScreenUtil.screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          2.hBox,
          (label == null)
              ? 0.hBox
              : Column(
                  children: [
                    Row(
                      children: [
                        AppText(
                          text: label!.upperFirst,
                          color: ColorResources.TEXT2,
                          weight: FontWeight.w500,
                          size: 12,
                        ),
                        4.wBox,
                        if(isrequired==true)
                        AppText(
                          text: '*',
                          color: ColorResources.RED,
                          weight: FontWeight.w500,
                          size: 12,
                        ),

                      ],
                    ),
                    5.hBox,
                  ],
                ),
          SizedBox(
            height: height ?? (multiline!=null?null: 45),
            child: Center(
              child: TextFormField(
                onTap: onTap,
                onChanged: onChanged,
                obscureText: isobsecure ?? false,
                controller: controller,
                keyboardType: type ?? TextInputType.text,
                readOnly: readonly ?? false,
                maxLines: multiline,
                style: textstyle ??
                    const TextStyle(
                      color: ColorResources.TEXT1,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                 inputFormatters: digitsonly==true
              ? <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))
                ]
              : [],
                textAlign: contentalign ?? TextAlign.start,
                decoration: InputDecoration(
                    label: labelshow == true
                        ? AppText(
                            text: hinttext ?? '',
                            color: secondarycolor,
                            size: 12,
                            weight: FontWeight.w400,
                          )
                        : null,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: padding,vertical:multiline!=null?8: vcontentpadding??0 ),
                    filled: true,
                    fillColor:
                        filledcolor ?? ColorResources.GREY5.withOpacity(0.25),
                    hintText: hinttext,
                    prefixIcon: prefix,
                    suffixIcon: suffix,
                    hintStyle: hintStyle ??
                        TextStyle(
                            color: ColorResources.BLACK.withOpacity(0.4),
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            fontFamily: ''),
                    border: borderstyle ??
                        OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3),
                          borderSide: BorderSide(
                              color:ColorResources.ICON_GREY.withOpacity(0.5), width: 1),
                        ),
                    focusedBorder: borderstyle ??
                        OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3),
                          borderSide: BorderSide(
                              color: ColorResources.ICON_GREY.withOpacity(0.5), width: 1),
                        ),
                    enabledBorder: borderstyle ??
                        OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3),
                          borderSide: BorderSide(
                              color: ColorResources.ICON_GREY.withOpacity(0.5), width: 1),
                        )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


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
    return Container(
      height: multiline!=null?(60.78*multiline!): 60.78,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
                      color:ColorResources.WHITE.withOpacity(0.5), width: 0.42),
      ),
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
                color: ColorResources.WHITE,
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
            
              contentPadding:
                  EdgeInsets.symmetric(horizontal:padding ,vertical:multiline!=null?8: vcontentpadding??0 ),
              // filled: true,
              // fillColor:
              //     filledcolor ?? ColorResources.GREY5.withOpacity(0.25),
              hintText: hinttext,
              
              prefixIcon: prefix,
              suffixIcon: suffix,
              labelText: label,
              labelStyle: const TextStyle(
                color: ColorResources.WHITE,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Montserrat'
              ),
              hintStyle: hintStyle ??
                  const TextStyle(
                      color: ColorResources.HINTTEXT,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Montserrat',
                      fontSize: 13,),
              border:InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder:InputBorder.none,),
        ),
      ),
    );
  }
}

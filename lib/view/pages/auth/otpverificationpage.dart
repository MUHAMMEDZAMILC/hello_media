import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_media/model/loginmodel.dart';
import 'package:hello_media/model/loginres_model.dart';
import 'package:hello_media/utils/helper/help_screensize.dart';
import 'package:hello_media/utils/helper/help_toast.dart';
import 'package:hello_media/utils/helper/pagenavigator.dart';
import 'package:hello_media/utils/string.dart';
import 'package:hello_media/utils/theme/colors.dart';
import 'package:hello_media/utils/theme/dimensions.dart';
import 'package:hello_media/utils/theme/theme_data.dart';
import 'package:hello_media/view/components/apptext.dart';
import 'package:hello_media/view/components/apptextfeild.dart';
import 'package:hello_media/view/pages/home/homepage.dart';
import 'package:provider/provider.dart';

import '../../../controller/provider/provideroperation.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  TextEditingController countrycodeCtrl = TextEditingController(),
  mobilenoCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
     final service =  Provider.of<ProviderOperation>(context,listen: false);
    final liveservice = Provider.of<ProviderOperation>(context,listen: true);
    ScreenUtil.init(context);
    return Scaffold(
      body: SizedBox(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:  padding17,vertical: 83),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              
                children: [
                  AppText(text: enetrnumbertxt,color: ColorResources.WHITE,size: 23,weight: FontWeight.w500,),
                  gap,
                  AppText(text: logindesctxt,color: ColorResources.WHITE,size: 12,weight: FontWeight.w400,),
                  gap26,
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: AppTextFeild(controller: countrycodeCtrl,label: '+91',suffix: const Icon(Icons.arrow_drop_down,color: ColorResources.WHITE,),readonly: true,),),
                      gapHorizontal,
                      Expanded(
                        flex: 5,
                        child: AppTextFeild(controller: mobilenoCtrl,hinttext: 'Enter Mobile Number',type:TextInputType.number ,)),
                    ],
                  ),
                  
                 
                ],
              ),
              Positioned(
                top: ScreenUtil.screenHeight!*0.6,
                child:  InkWell(
                  onTap: () async{
                  if (mobilenoCtrl.text.isEmpty) {
                    snackBar(context, message: 'Mobile Number is Required');
                    return ;
                  }
                  LoginModel body = LoginModel();
                  body.phone = mobilenoCtrl.text;
                  body.countryCode = '+91';
                  LoginResponse res = await service.otpverify(context, body);
                  if (res.status==true && res.token?.access!=null) {
                    Screen.openAsNewPage(context, const HomeScreen());
                  }
                    
                  },
                  child: Row(
                    children: [
                      Container(
                          height: 50,
                          width: 136,
                          decoration: BoxDecoration(
                            border:Border.all(color: ColorResources.WHITE.withOpacity(0.28),),
                            borderRadius: BorderRadius.circular(25.5)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal:  8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(text: 'Continue',color: ColorResources.WHITE,size: 14,weight: FontWeight.w400,),
                                Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    color: primarycolor,
                                    borderRadius: BorderRadius.circular(25.5),
                            
                                  ),
                                  child: const Icon(CupertinoIcons.chevron_forward,color: ColorResources.WHITE,),
                                )
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ))
            ],

          ),
        ),
      ),
    );
  }
}
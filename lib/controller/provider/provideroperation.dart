

import 'package:flutter/material.dart';
import 'package:hello_media/controller/provider/providerservice.dart';
import 'package:hello_media/controller/shared_pref.dart';
import 'package:hello_media/model/homemodel.dart';
import 'package:hello_media/model/loginmodel.dart';
import 'package:hello_media/model/loginres_model.dart';
import 'package:hello_media/utils/globalvariables.dart';
import 'package:hello_media/utils/helper/help_toast.dart';
import 'package:hello_media/utils/string.dart';

class ProviderOperation extends ChangeNotifier {
  ProviderService ntop = ProviderService();
  bool ispageloading = false,isbtnloading = false;

  // otp verification method

  otpverify(context,LoginModel body) async {
    isbtnloading = true;
   LoginResponse res = await ntop.otpverify(context, body);
   if (res.status== true) {
    accesstoken = res.token?.access;
     await SharedPref.save(key: accesskey, value: res.token?.access);
     return res;  
   }else{
    snackBar(context, message: 'Otp Verification Failed');
   }
    isbtnloading = false;
    notifyListeners();
  }

//  gethome content method
late HomeContent homedata;
  gethomecontent(context) async {
    ispageloading = true;
    homedata = await ntop.gethomepagecontent(context);
    ispageloading = false;
    notifyListeners();
  }
}
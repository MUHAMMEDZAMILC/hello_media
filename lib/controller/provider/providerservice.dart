import 'dart:developer';
import 'dart:io';

import 'package:hello_media/model/categorymodel.dart';
import 'package:hello_media/model/loginmodel.dart';
import 'package:hello_media/model/loginres_model.dart';

import '../../model/homemodel.dart';
import '../../utils/helper/help_toast.dart';
import '../urls.dart';
import 'package:http/http.dart' as http;

class ProviderService {

  dynamic header = {
      'Authorization': 'Bearer ',
    };


   otpverify(context,LoginModel userdata) async{
    LoginResponse empty = LoginResponse();
    var url = "$baseUrl$otpvaerifyUrl";
    log(url);
    try {
       final Uri uri = Uri.parse(url);
        var response = await http.post(uri,body: userdata.toJson() );
        log(response.body);
        if (response.statusCode==202) {
          return loginResponseFromJson(response.body);
        }else{
          
          snackBar(context, message: 'Otp Verification Failed');
          return empty;
        }
    }on SocketException {
      snackBar(context, message: 'Network Offline');
      return empty;
    } catch (e) {
      log(e.toString());
      return empty;
    }
  }
// get home content api service
  gethomepagecontent(context) async{
     var url ="$baseUrl$gethomeUrl";
    log(url);
    try {
      final Uri uri = Uri.parse(url);
    var response = await http.get(uri, );
    log(response.body);
    if (response.statusCode == 202) {
      try {
        return homeContentFromJson(response.body);
      } catch (e) {
        rethrow;
      }
    } else {
      snackBar(context, message: "invalid");
    }
    }on SocketException{
      snackBar(context, message: 'Network Offline');
    } catch (e) {
      log(e.toString());
    }
  }
   // get category api service
  getcategories(context) async{
    var url ="$baseUrl$getcategoryUrl";
    log(url);
    try {
      final Uri uri = Uri.parse(url);
    var response = await http.get(uri, );
    log(response.body);
    if (response.statusCode == 200) {
      try {
        return categoryModelFromJson(response.body).categories;
      } catch (e) {
        rethrow;
      }
    } else {
      snackBar(context, message: "invalid");
    }
    }on SocketException{
      snackBar(context, message: 'Network Offline');
    } catch (e) {
      log(e.toString());
    }
    
  }
}
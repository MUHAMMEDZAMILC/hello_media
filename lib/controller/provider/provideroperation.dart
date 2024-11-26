import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hello_media/model/categorymodel.dart';
import 'package:hello_media/model/loginmodel.dart';

import '../../utils/helper/help_toast.dart';
import '../urls.dart';
import 'package:http/http.dart' as http;

class ProviderOperation extends ChangeNotifier {

  otpverify(context,LoginModel userdata) async{
    var url = "$baseUrl$otpvaerifyUrl";
    log(url);
    try {
       final Uri uri = Uri.parse(url);
        var response = await http.post(uri,body: userdata.toJson() );
    }on SocketException {
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
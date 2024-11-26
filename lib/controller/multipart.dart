// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hello_media/controller/urls.dart';
import 'package:hello_media/model/feedpost_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../utils/globalvariables.dart';
import '../utils/helper/help_loader.dart';
import '../utils/helper/help_toast.dart';

class MultipartApi {
 static Map<String, String> header = {
      'Authorization': 'Bearer $accesstoken',
    };
  static Future<dynamic> upload(BuildContext context,
      {required String endPoint,
      required List<MultipartFile>? video,
      required List<MultipartFile>? image,
      required FeedUpload body,
      bool isShowMessage = false}) async {
    try {
      loader(context: context);
      var request = http.MultipartRequest('POST', Uri.parse('$baseUrl$endPoint'),);
            request.headers.addAll(header);
      if (video != null) {
        request.files.addAll(video);
      }
      if (image != null) {
        request.files.addAll(image);
      }
      request.fields['desc'] = body.desc??'';
      request.fields['category[]'] = body.category.toString();
      // request.fields.addAll(body);

      log(accesstoken??'');
      log('$baseUrl$endPoint');
      log(jsonEncode(request.fields));
      log(jsonEncode(request.headers));

      var response = await request.send();
      var responseData = await response.stream.toBytes();
      var responseToString = String.fromCharCodes(responseData);
      log(responseToString.toString());
      hideLoader(context);
      return responseToString;
    
    } on SocketException {
      hideLoader(context);
      snackBar(context, message: "No internet connection", type: MessageType.warning);
    } catch (e) {
      // hideLoader(context);
      throw Exception("$e");
    }
  }
}
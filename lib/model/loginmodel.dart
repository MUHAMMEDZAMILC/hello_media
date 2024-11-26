// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    String? countryCode;
    String? phone;

    LoginModel({
        this.countryCode,
        this.phone,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        countryCode: json["country_code"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "country_code": countryCode,
        "phone": phone,
    };
}

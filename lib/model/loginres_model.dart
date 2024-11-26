// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    bool? status = false;
    bool? privilage;
    Token? token;
    String? phone;

    LoginResponse({
        this.status = false,
        this.privilage,
        this.token,
        this.phone,
    });

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        status: json["status"],
        privilage: json["privilage"],
        token: json["token"] == null ? null : Token.fromJson(json["token"]),
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "privilage": privilage,
        "token": token?.toJson(),
        "phone": phone,
    };
}

class Token {
    String? refresh;
    String? access;

    Token({
        this.refresh,
        this.access,
    });

    factory Token.fromJson(Map<String, dynamic> json) => Token(
        refresh: json["refresh"],
        access: json["access"],
    );

    Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
    };
}

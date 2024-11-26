// To parse this JSON data, do
//
//     final feedRes = feedResFromJson(jsonString);

import 'dart:convert';

FeedRes feedResFromJson(String str) => FeedRes.fromJson(json.decode(str));

String feedResToJson(FeedRes data) => json.encode(data.toJson());

class FeedRes {
    bool? status = false;
    String? message;
    ValidationErrors? validationErrors;

    FeedRes({
        this.status = false,
        this.message,
        this.validationErrors,
    });

    factory FeedRes.fromJson(Map<String, dynamic> json) => FeedRes(
        status: json["status"],
        message: json["message"],
        validationErrors: json["validation_errors"] == null ? null : ValidationErrors.fromJson(json["validation_errors"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "validation_errors": validationErrors?.toJson(),
    };
}

class ValidationErrors {
    List<String>? video;

    ValidationErrors({
        this.video,
    });

    factory ValidationErrors.fromJson(Map<String, dynamic> json) => ValidationErrors(
        video: json["video"] == null ? [] : List<String>.from(json["video"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "video": video == null ? [] : List<dynamic>.from(video!.map((x) => x)),
    };
}

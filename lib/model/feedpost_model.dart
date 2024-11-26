// To parse this JSON data, do
//
//     final feedUpload = feedUploadFromJson(jsonString);

import 'dart:convert';
import 'dart:io';

FeedUpload feedUploadFromJson(String str) => FeedUpload.fromJson(json.decode(str));

String feedUploadToJson(FeedUpload data) => json.encode(data.toJson());

class FeedUpload {
    File? video;
    File? image;
    String? desc;
    List<int>? category;

    FeedUpload({
      this.video,
      this.image,
        this.desc,
        this.category,
    });

    factory FeedUpload.fromJson(Map<String, dynamic> json) => FeedUpload(
        desc: json["desc"],
        category: json["category"] == null ? [] : List<int>.from(json["category"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "video": video,
        "image": image,
        "desc": desc,
        "category": category == null ? [] : List<dynamic>.from(category!.map((x) => x)),
    };
}

// To parse this JSON data, do
//
//     final homeContent = homeContentFromJson(jsonString);

import 'dart:convert';

HomeContent homeContentFromJson(String str) => HomeContent.fromJson(json.decode(str));

String homeContentToJson(HomeContent data) => json.encode(data.toJson());

class HomeContent {
    List<dynamic>? user;
    List<dynamic>? banners;
    List<CategoryDict>? categoryDict;
    List<Result>? results;

    HomeContent({
        this.user,
        this.banners,
        this.categoryDict,
        this.results,
    });

    factory HomeContent.fromJson(Map<String, dynamic> json) => HomeContent(
        user: json["user"] == null ? [] : List<dynamic>.from(json["user"]!.map((x) => x)),
        banners: json["banners"] == null ? [] : List<dynamic>.from(json["banners"]!.map((x) => x)),
        categoryDict: json["category_dict"] == null ? [] : List<CategoryDict>.from(json["category_dict"]!.map((x) => CategoryDict.fromJson(x))),
        results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "user": user == null ? [] : List<dynamic>.from(user!.map((x) => x)),
        "banners": banners == null ? [] : List<dynamic>.from(banners!.map((x) => x)),
        "category_dict": categoryDict == null ? [] : List<CategoryDict>.from(categoryDict!.map((x) => x.toJson())),
        "results": results == null ? [] : List<Result>.from(results!.map((x) => x.toJson())),
    };
}

class CategoryDict {
    String? id;
    String? title;

    CategoryDict({
        this.id,
        this.title,
    });

    factory CategoryDict.fromJson(Map<String, dynamic> json) => CategoryDict(
        id: json["id"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
    };
}

class Result {
    int? id;
    String? description;
    String? image;
    String? video;
    List<int>? likes;
    List<dynamic>? dislikes;
    List<dynamic>? bookmarks;
    List<dynamic>? hide;
    DateTime? createdAt;
    bool? follow;
    User? user;

    Result({
        this.id,
        this.description,
        this.image,
        this.video,
        this.likes,
        this.dislikes,
        this.bookmarks,
        this.hide,
        this.createdAt,
        this.follow,
        this.user,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        description: json["description"],
        image: json["image"],
        video: json["video"],
        likes: json["likes"] == null ? [] : List<int>.from(json["likes"]!.map((x) => x)),
        dislikes: json["dislikes"] == null ? [] : List<dynamic>.from(json["dislikes"]!.map((x) => x)),
        bookmarks: json["bookmarks"] == null ? [] : List<dynamic>.from(json["bookmarks"]!.map((x) => x)),
        hide: json["hide"] == null ? [] : List<dynamic>.from(json["hide"]!.map((x) => x)),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        follow: json["follow"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "image": image,
        "video": video,
        "likes": likes == null ? [] : List<dynamic>.from(likes!.map((x) => x)),
        "dislikes": dislikes == null ? [] : List<dynamic>.from(dislikes!.map((x) => x)),
        "bookmarks": bookmarks == null ? [] : List<dynamic>.from(bookmarks!.map((x) => x)),
        "hide": hide == null ? [] : List<dynamic>.from(hide!.map((x) => x)),
        "created_at": createdAt?.toIso8601String(),
        "follow": follow,
        "user": user?.toJson(),
    };
}

class User {
    int? id;
    String? name;
    dynamic image;

    User({
        this.id,
        this.name,
        this.image,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
    };
}

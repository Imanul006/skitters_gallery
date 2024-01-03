import 'dart:convert';

List<ImageModel> imageModelFromJson(String str) =>
    List<ImageModel>.from(json.decode(str).map((x) => ImageModel.fromJson(x)));

String imageModelToJson(List<ImageModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ImageModel {
    String id;
    String? description;
    String? altDescription;
    Urls urls;
    int likes;
    User user;

    ImageModel({
        required this.id,
        this.description,
        this.altDescription,
        required this.urls,
        required this.likes,
        required this.user,
    });

    factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        id: json["id"],
        description: json["description"],
        altDescription: json["alt_description"],
        urls: Urls.fromJson(json["urls"]),
        likes: json["likes"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "alt_description": altDescription,
        "urls": urls.toJson(),
        "likes": likes,
        "user": user.toJson(),
    };
}

class Urls {
    String small;
    String thumb;
    String regular;
    String full;

    Urls({
        required this.small,
        required this.thumb,
        required this.regular,
        required this.full,
    });

    factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        small: json["small"],
        thumb: json["thumb"],
        regular: json["regular"],
        full: json["full"],
    );

    Map<String, dynamic> toJson() => {
        "small": small,
        "thumb": thumb,
    };
}

class User {
    String name;
    ProfileImage profileImage;

    User({
        required this.name,
        required this.profileImage,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        profileImage: ProfileImage.fromJson(json["profile_image"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "profile_image": profileImage.toJson(),
    };
}

class ProfileImage {
    String small;

    ProfileImage({
        required this.small,
    });

    factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
        small: json["small"],
    );

    Map<String, dynamic> toJson() => {
        "small": small,
    };
}

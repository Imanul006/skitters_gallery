// // To parse this JSON data, do
// //
// //     final imageModel = imageModelFromJson(jsonString);

// import 'dart:convert';

// List<ImageModel> imageModelFromJson(String str) => List<ImageModel>.from(json.decode(str).map((x) => ImageModel.fromJson(x)));

// String imageModelToJson(List<ImageModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class ImageModel {
//     String id;
//     String slug;
//     DateTime createdAt;
//     DateTime updatedAt;
//     DateTime? promotedAt;
//     int width;
//     int height;
//     String color;
//     String blurHash;
//     String? description;
//     String altDescription;
//     List<dynamic> breadcrumbs;
//     Urls urls;
//     ImageModelLinks links;
//     int likes;
//     bool likedByUser;
//     List<dynamic> currentUserCollections;
//     Sponsorship? sponsorship;
//     TopicSubmissions topicSubmissions;
//     User user;

//     ImageModel({
//         required this.id,
//         required this.slug,
//         required this.createdAt,
//         required this.updatedAt,
//         required this.promotedAt,
//         required this.width,
//         required this.height,
//         required this.color,
//         required this.blurHash,
//         required this.description,
//         required this.altDescription,
//         required this.breadcrumbs,
//         required this.urls,
//         required this.links,
//         required this.likes,
//         required this.likedByUser,
//         required this.currentUserCollections,
//         required this.sponsorship,
//         required this.topicSubmissions,
//         required this.user,
//     });

//     factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
//         id: json["id"],
//         slug: json["slug"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         promotedAt: json["promoted_at"] == null ? null : DateTime.parse(json["promoted_at"]),
//         width: json["width"],
//         height: json["height"],
//         color: json["color"],
//         blurHash: json["blur_hash"],
//         description: json["description"],
//         altDescription: json["alt_description"],
//         breadcrumbs: List<dynamic>.from(json["breadcrumbs"].map((x) => x)),
//         urls: Urls.fromJson(json["urls"]),
//         links: ImageModelLinks.fromJson(json["links"]),
//         likes: json["likes"],
//         likedByUser: json["liked_by_user"],
//         currentUserCollections: List<dynamic>.from(json["current_user_collections"].map((x) => x)),
//         sponsorship: json["sponsorship"] == null ? null : Sponsorship.fromJson(json["sponsorship"]),
//         topicSubmissions: TopicSubmissions.fromJson(json["topic_submissions"]),
//         user: User.fromJson(json["user"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "slug": slug,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "promoted_at": promotedAt?.toIso8601String(),
//         "width": width,
//         "height": height,
//         "color": color,
//         "blur_hash": blurHash,
//         "description": description,
//         "alt_description": altDescription,
//         "breadcrumbs": List<dynamic>.from(breadcrumbs.map((x) => x)),
//         "urls": urls.toJson(),
//         "links": links.toJson(),
//         "likes": likes,
//         "liked_by_user": likedByUser,
//         "current_user_collections": List<dynamic>.from(currentUserCollections.map((x) => x)),
//         "sponsorship": sponsorship?.toJson(),
//         "topic_submissions": topicSubmissions.toJson(),
//         "user": user.toJson(),
//     };
// }

// class ImageModelLinks {
//     String self;
//     String html;
//     String download;
//     String downloadLocation;

//     ImageModelLinks({
//         required this.self,
//         required this.html,
//         required this.download,
//         required this.downloadLocation,
//     });

//     factory ImageModelLinks.fromJson(Map<String, dynamic> json) => ImageModelLinks(
//         self: json["self"],
//         html: json["html"],
//         download: json["download"],
//         downloadLocation: json["download_location"],
//     );

//     Map<String, dynamic> toJson() => {
//         "self": self,
//         "html": html,
//         "download": download,
//         "download_location": downloadLocation,
//     };
// }

// class Sponsorship {
//     List<String> impressionUrls;
//     String tagline;
//     String taglineUrl;
//     User sponsor;

//     Sponsorship({
//         required this.impressionUrls,
//         required this.tagline,
//         required this.taglineUrl,
//         required this.sponsor,
//     });

//     factory Sponsorship.fromJson(Map<String, dynamic> json) => Sponsorship(
//         impressionUrls: List<String>.from(json["impression_urls"].map((x) => x)),
//         tagline: json["tagline"],
//         taglineUrl: json["tagline_url"],
//         sponsor: User.fromJson(json["sponsor"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "impression_urls": List<dynamic>.from(impressionUrls.map((x) => x)),
//         "tagline": tagline,
//         "tagline_url": taglineUrl,
//         "sponsor": sponsor.toJson(),
//     };
// }

// class User {
//     String id;
//     DateTime updatedAt;
//     String username;
//     String name;
//     String firstName;
//     String? lastName;
//     String? twitterUsername;
//     String portfolioUrl;
//     String? bio;
//     String location;
//     UserLinks links;
//     ProfileImage profileImage;
//     String? instagramUsername;
//     int totalCollections;
//     int totalLikes;
//     int totalPhotos;
//     int totalPromotedPhotos;
//     bool acceptedTos;
//     bool forHire;
//     Social social;

//     User({
//         required this.id,
//         required this.updatedAt,
//         required this.username,
//         required this.name,
//         required this.firstName,
//         required this.lastName,
//         required this.twitterUsername,
//         required this.portfolioUrl,
//         required this.bio,
//         required this.location,
//         required this.links,
//         required this.profileImage,
//         required this.instagramUsername,
//         required this.totalCollections,
//         required this.totalLikes,
//         required this.totalPhotos,
//         required this.totalPromotedPhotos,
//         required this.acceptedTos,
//         required this.forHire,
//         required this.social,
//     });

//     factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["id"],
//         updatedAt: DateTime.parse(json["updated_at"]),
//         username: json["username"],
//         name: json["name"],
//         firstName: json["first_name"],
//         lastName: json["last_name"],
//         twitterUsername: json["twitter_username"],
//         portfolioUrl: json["portfolio_url"],
//         bio: json["bio"],
//         location: json["location"],
//         links: UserLinks.fromJson(json["links"]),
//         profileImage: ProfileImage.fromJson(json["profile_image"]),
//         instagramUsername: json["instagram_username"],
//         totalCollections: json["total_collections"],
//         totalLikes: json["total_likes"],
//         totalPhotos: json["total_photos"],
//         totalPromotedPhotos: json["total_promoted_photos"],
//         acceptedTos: json["accepted_tos"],
//         forHire: json["for_hire"],
//         social: Social.fromJson(json["social"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "updated_at": updatedAt.toIso8601String(),
//         "username": username,
//         "name": name,
//         "first_name": firstName,
//         "last_name": lastName,
//         "twitter_username": twitterUsername,
//         "portfolio_url": portfolioUrl,
//         "bio": bio,
//         "location": location,
//         "links": links.toJson(),
//         "profile_image": profileImage.toJson(),
//         "instagram_username": instagramUsername,
//         "total_collections": totalCollections,
//         "total_likes": totalLikes,
//         "total_photos": totalPhotos,
//         "total_promoted_photos": totalPromotedPhotos,
//         "accepted_tos": acceptedTos,
//         "for_hire": forHire,
//         "social": social.toJson(),
//     };
// }

// class UserLinks {
//     String self;
//     String html;
//     String photos;
//     String likes;
//     String portfolio;
//     String following;
//     String followers;

//     UserLinks({
//         required this.self,
//         required this.html,
//         required this.photos,
//         required this.likes,
//         required this.portfolio,
//         required this.following,
//         required this.followers,
//     });

//     factory UserLinks.fromJson(Map<String, dynamic> json) => UserLinks(
//         self: json["self"],
//         html: json["html"],
//         photos: json["photos"],
//         likes: json["likes"],
//         portfolio: json["portfolio"],
//         following: json["following"],
//         followers: json["followers"],
//     );

//     Map<String, dynamic> toJson() => {
//         "self": self,
//         "html": html,
//         "photos": photos,
//         "likes": likes,
//         "portfolio": portfolio,
//         "following": following,
//         "followers": followers,
//     };
// }

// class ProfileImage {
//     String small;
//     String medium;
//     String large;

//     ProfileImage({
//         required this.small,
//         required this.medium,
//         required this.large,
//     });

//     factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
//         small: json["small"],
//         medium: json["medium"],
//         large: json["large"],
//     );

//     Map<String, dynamic> toJson() => {
//         "small": small,
//         "medium": medium,
//         "large": large,
//     };
// }

// class Social {
//     String? instagramUsername;
//     String portfolioUrl;
//     String? twitterUsername;
//     dynamic paypalEmail;

//     Social({
//         required this.instagramUsername,
//         required this.portfolioUrl,
//         required this.twitterUsername,
//         required this.paypalEmail,
//     });

//     factory Social.fromJson(Map<String, dynamic> json) => Social(
//         instagramUsername: json["instagram_username"],
//         portfolioUrl: json["portfolio_url"],
//         twitterUsername: json["twitter_username"],
//         paypalEmail: json["paypal_email"],
//     );

//     Map<String, dynamic> toJson() => {
//         "instagram_username": instagramUsername,
//         "portfolio_url": portfolioUrl,
//         "twitter_username": twitterUsername,
//         "paypal_email": paypalEmail,
//     };
// }

// class TopicSubmissions {
//     TopicSubmissions();

//     factory TopicSubmissions.fromJson(Map<String, dynamic> json) => TopicSubmissions(
//     );

//     Map<String, dynamic> toJson() => {
//     };
// }

// class Urls {
//     String raw;
//     String full;
//     String regular;
//     String small;
//     String thumb;
//     String smallS3;

//     Urls({
//         required this.raw,
//         required this.full,
//         required this.regular,
//         required this.small,
//         required this.thumb,
//         required this.smallS3,
//     });

//     factory Urls.fromJson(Map<String, dynamic> json) => Urls(
//         raw: json["raw"],
//         full: json["full"],
//         regular: json["regular"],
//         small: json["small"],
//         thumb: json["thumb"],
//         smallS3: json["small_s3"],
//     );

//     Map<String, dynamic> toJson() => {
//         "raw": raw,
//         "full": full,
//         "regular": regular,
//         "small": small,
//         "thumb": thumb,
//         "small_s3": smallS3,
//     };
// }


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

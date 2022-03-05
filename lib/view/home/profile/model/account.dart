// To parse this JSON data, do
//
//     final account = accountFromJson(jsonString);

import 'dart:convert';

Account accountFromJson(String str) => Account.fromJson(json.decode(str));

String accountToJson(Account data) => json.encode(data.toJson());

class Account {
  Account({
    this.id,
    this.email,
    this.image,
    this.location,
    this.favoriteBlogIds,
  });

  String? id;
  String? email;
  String? image;
  Location? location;
  List<String>? favoriteBlogIds;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["Id"],
        email: json["Email"],
        image: json["Image"],
        location: Location.fromJson(json["Location"] ?? {}),
        favoriteBlogIds: List<String>.from(json["FavoriteBlogIds"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Email": email,
        "Image": image,
        "Location": location?.toJson(),
        "FavoriteBlogIds": favoriteBlogIds == null ? "" : List<dynamic>.from(favoriteBlogIds!.map((x) => x)),
      };
}

class Location {
  Location({
    this.longtitude,
    this.latitude,
  });

  String? longtitude;
  String? latitude;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        longtitude: json["Longtitude"],
        latitude: json["Latitude"],
      );

  Map<String, dynamic> toJson() => {
        "Longtitude": longtitude,
        "Latitude": latitude,
      };
}

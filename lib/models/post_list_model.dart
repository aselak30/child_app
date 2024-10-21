// To parse this JSON data, do
//
//     final postListModel = postListModelFromJson(jsonString);

import 'dart:convert';

List<PostListModel> postListModelFromJson(String str) =>
    List<PostListModel>.from(
        json.decode(str).map((x) => PostListModel.fromJson(x)));

String postListModelToJson(List<PostListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostListModel {
  String id;
  String title;
  String featuredImage;
  String description;

  PostListModel({
    required this.id,
    required this.title,
    required this.featuredImage,
    required this.description,
  });

  factory PostListModel.fromJson(Map<String, dynamic> json) => PostListModel(
        id: json["ID"],
        title: json["title"],
        featuredImage: json["featured_image"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "title": title,
        "featured_image": featuredImage,
        "description": description,
      };
}

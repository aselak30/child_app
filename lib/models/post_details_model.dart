// To parse this JSON data, do
//
//     final postDetailsModel = postDetailsModelFromJson(jsonString);

import 'dart:convert';

PostDetailsModel postDetailsModelFromJson(String str) =>
    PostDetailsModel.fromJson(json.decode(str));

String postDetailsModelToJson(PostDetailsModel data) =>
    json.encode(data.toJson());

class PostDetailsModel {
  int postId;
  // ignore: prefer_typing_uninitialized_variables
  var featuredImage;
  String translatedTitle;
  String translatedContent;

  PostDetailsModel({
    required this.postId,
    required this.featuredImage,
    required this.translatedTitle,
    required this.translatedContent,
  });

  factory PostDetailsModel.fromJson(Map<String, dynamic> json) =>
      PostDetailsModel(
        postId: json["post_id"],
        featuredImage: json["featured_image"],
        translatedTitle: json["translated_title"],
        translatedContent: json["translated_content"],
      );

  Map<String, dynamic> toJson() => {
        "post_id": postId,
        "featured_image": featuredImage,
        "translated_title": translatedTitle,
        "translated_content": translatedContent,
      };
}

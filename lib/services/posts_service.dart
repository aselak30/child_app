import 'dart:convert';

import 'package:chilld_app/constants.dart';
import 'package:chilld_app/models/post_details_model.dart';
import 'package:chilld_app/models/post_list_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostsService {
  static Future<List<PostListModel>> getPosts(
    BuildContext context,
    String language,
  ) async {
    try {
      final response = await http.get(
        Uri.parse('${baseUrl}custom-api/v1/posts/english'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      debugPrint(response.body.toString());
      debugPrint(response.statusCode.toString());

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        return responseData.map((e) => PostListModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load Posts');
      }
    } catch (e) {
      throw Exception('Failed to load Posts: $e');
    }
  }

  static Future<PostDetailsModel> getPostDetails(
    BuildContext context,
    String language,
    String postId,
  ) async {
    try {
      final response = await http.get(
        Uri.parse('${baseUrl}custom-api/v1/translations/$postId/$language'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      debugPrint(response.body.toString());
      debugPrint(response.statusCode.toString());

      if (response.statusCode == 200) {
        // Decoding the JSON response as a Map
        final responseData = json.decode(response.body) as Map<String, dynamic>;

        // Creating a PostDetailsModel from the response data
        return PostDetailsModel.fromJson(responseData);
      } else {
        throw Exception('Failed to load Post Details');
      }
    } catch (e) {
      throw Exception('Failed to load Details: $e');
    }
  }
}

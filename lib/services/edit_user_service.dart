import 'dart:convert';

import 'package:chilld_app/constants.dart';
import 'package:chilld_app/models/login_model.dart';
import 'package:chilld_app/models/post_details_model.dart';
import 'package:chilld_app/models/post_list_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditUserService {
  static Future<LoginModel> saveEditUser(
    BuildContext context,
    int user_id,
    String email,
    // String password,
    String first_name,
    String last_name,
  ) async {
    Map<String, dynamic> body = {
      "api_key": apiKey,
      'user_id': user_id,
      'email': email,
      // 'password': password,
      'first_name': first_name,
      'last_name': last_name,
    };
    try {
      final response = await http.post(
        Uri.parse('${baseUrl}custom/v1/update_user'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(body),
      );

      debugPrint(response.body.toString());
      debugPrint(response.statusCode.toString());

      if (response.statusCode == 200) {
        // Decoding the JSON response as a Map
        // final responseData = json.decode(response.body) as Map<String, dynamic>;
        final responseData = json.decode(response.body);

        return LoginModel.fromJson(responseData);
      } else {
        throw Exception('Failed to Edit Details');
      }
    } catch (e) {
      throw Exception('Failed to Edit Details: $e');
    }
  }
}

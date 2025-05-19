// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:chilld_app/constants.dart';
import 'package:chilld_app/dialog/change_passowrd_dialog.dart';
import 'package:chilld_app/dialogs/custome_loading_dialog.dart';
import 'package:chilld_app/models/login_model.dart';
import 'package:chilld_app/services/secure_storage_service.dart';
import 'package:chilld_app/ui/mp/bottom_naviagation_bar/dash_board_screen.dart';
import 'package:chilld_app/ui/mp/loading_screen/landing_screen.dart';
import 'package:chilld_app/ui/mp/register_screen/register_success_screen.dart';
import 'package:chilld_app/widgets/snak_bars.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class AuthenticationService extends ChangeNotifier {
  String userId = '';
  String otpCode = '';
  String mobileNumber = '';
  String consumerId = '';
  String role = '';

  void checkLogin(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () async {
        String? token = await SecureStorageManager().getToken();
        if (token != null) {
          applicationInit(context);
        } else {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const LandingScreen(),
            ),
            (route) => false,
          );
        }
      },
    );
  }

  Future<void> applicationInit(BuildContext context) async {
    try {
      authToken = await SecureStorageManager().getToken() ?? '';
      // role = await SecureStorageManager().getRole() ?? '';
      // print(role);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const DashBoardScreen(),
        ),
        (route) => false,
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(
          error.toString(),
        ),
      );
    }
  }

  Future<void> login(
    BuildContext context,
    String username,
    String password,
  ) async {
    Map<String, dynamic> body = {
      "api_key": apiKey,
      'username': username,
      'password': password,
    };
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const CustomLoadingDialog(
          title: 'Logging In',
        ),
      );

      final response = await http.post(
        Uri.parse('${baseUrl}custom/v1/login'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(body),
      );

      Navigator.pop(context);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        SecureStorageManager().storeToken(
          responseData['token'].toString(),
        );
        log(responseData.toString());

        SecureStorageManager.saveUser(
          user: LoginModel.fromJson(responseData),
        );

        applicationInit(context);
        notifyListeners();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          errorSnackBar('Invalid credentials!'),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(e.toString()),
      );
    }
  }

  Future<void> register(
    BuildContext context,
    // String apiKey,
    String username,
    String email,
    String password,
    String firstName,
    String lastName,
  ) async {
    Map<String, dynamic> data = {
      "api_key": apiKey,
      "username": username,
      "email": email,
      "password": password,
      "first_name": firstName,
      "last_name": lastName,
    };

    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const CustomLoadingDialog(
          title: 'Registering',
        ),
      );
      final response = await http.post(
        Uri.parse('${baseUrl}custom/v1/register'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(data),
      );

      log(response.body.toString());

      Navigator.pop(context);

      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const RegisterSuccessScreen(),
          ),
        );

        notifyListeners();
      } else {
        final responseBody = jsonDecode(response.body);
        final message = responseBody['message'];

        ScaffoldMessenger.of(context).showSnackBar(
          errorSnackBar('Could not complete registration, $message.'),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(e.toString()),
      );
    }
  }

  Future<void> changePassword(
    BuildContext context,
    String email,
  ) async {
    Map<String, dynamic> data = {
      "api_key": apiKey,
      "user_login": email,
    };

    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const CustomLoadingDialog(
          title: 'Loading..',
        ),
      );
      final response = await http.post(
        Uri.parse('${baseUrl}custom/v1/reset_password'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(data),
      );

      Navigator.pop(context);

      if (response.statusCode == 200) {
        showDialog(
          context: context,
          builder: (context) => const ChangePassowrdDialog(),
        );

        notifyListeners();
      } else {
        final responseBody = jsonDecode(response.body);
        final message = responseBody['message'];

        ScaffoldMessenger.of(context).showSnackBar(
          errorSnackBar('Could not complete registration, $message.'),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(e.toString()),
      );
    }
  }
}

import 'package:chilld_app/constants.dart';
import 'package:chilld_app/services/auth_service.dart';
import 'package:chilld_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<AuthenticationService>(context, listen: false).checkLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kPrimaryBlueColor, // Set the background color here
      body: Stack(
        children: [
          Positioned(
            bottom: SizeConfig.screenHeight * 0.3,
            left: 0,
            right: 0,
            child: Image.asset(
              kSplashImage,
              //  fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: kWhiteColor,
                  strokeWidth: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

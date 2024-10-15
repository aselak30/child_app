import 'package:chilld_app/constants.dart';
import 'package:chilld_app/size_config.dart';
import 'package:chilld_app/ui/mp/loging_screen/logging_screen.dart';
import 'package:chilld_app/widgets/custom_submit_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    super.initState();
    // Provider.of<AuthenticationService>(context, listen: false).checkLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kWhiteColor, // Set the background color here
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: kHorizontalPadding,
          vertical: kVerticalPadding,
        ),
        child: Stack(
          children: [
            Positioned(
              top: SizeConfig.screenHeight * 0.005,
              left: 0,
              right: 0,
              child: Image.asset(
                kKidsLogoImage,
                //  fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: SizeConfig.screenHeight * 0.4,
              left: 0,
              right: 0,
              child: Image.asset(
                kLoggingImage,
                //  fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: SizeConfig.screenHeight * 0.30,
              left: 0,
              right: 0,
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'The best place for children to get',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: kGrayColor,
                      //height: 0.9,
                      // letterSpacing: 5,
                    ),
                  ),
                  Text(
                    'advices & solutions.',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: kGrayColor,
                      //height: 0.9,
                      // letterSpacing: 5,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 70,
              left: 0,
              right: 0,
              child: CustomSubmitButton(
                title: 'LOGIN',
                color: kPrimaryBlueColor,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoggingScreen(),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 2,
              left: 0,
              right: 0,
              child:    TextButton(
                onPressed: () {
                  // Navigate to register screen
                },
                child: Text(
                  'REGISTER',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: kBlackColor,
                    //height: 0.9,
                    // letterSpacing: 5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

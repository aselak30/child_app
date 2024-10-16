import 'package:chilld_app/constants.dart';
import 'package:chilld_app/size_config.dart';
import 'package:chilld_app/ui/mp/loging_screen/logging_screen.dart';
import 'package:chilld_app/ui/mp/register_screen/register_screen.dart';
import 'package:chilld_app/widgets/custom_submit_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterSuccessScreen extends StatefulWidget {
  const RegisterSuccessScreen({super.key});

  @override
  State<RegisterSuccessScreen> createState() => _RegisterSuccessScreenState();
}

class _RegisterSuccessScreenState extends State<RegisterSuccessScreen> {
  @override
  void initState() {
    super.initState();
    // Provider.of<AuthenticationService>(context, listen: false).checkLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: kHorizontalPadding,
          vertical: kVerticalPadding,
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: SizeConfig.screenHeight * 0.5,
              left: 40,
              right: 0,
              child: Image.asset(
                kGirlImage,
                //  fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: SizeConfig.screenHeight * 0.37,
              left: 0,
              right: 0,
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Successful!',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                      color: kBlackColor,
                      //height: 0.9,
                      // letterSpacing: 5,
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    'You have successfully registered to the',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: kGrayColor.withOpacity(0.4),
                      //height: 0.9,
                      // letterSpacing: 5,
                    ),
                  ),
                  Text(
                    'system please login to the system to',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: kGrayColor.withOpacity(0.4),
                      //height: 0.9,
                      // letterSpacing: 5,
                    ),
                  ),
                  Text(
                    'explore',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: kGrayColor.withOpacity(0.4),
                      //height: 0.9,
                      // letterSpacing: 5,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
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

          ],
        ),
      ),
    );
  }
}

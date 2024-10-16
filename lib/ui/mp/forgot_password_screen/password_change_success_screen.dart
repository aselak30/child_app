import 'package:chilld_app/constants.dart';
import 'package:chilld_app/size_config.dart';
import 'package:chilld_app/ui/mp/loging_screen/logging_screen.dart';
import 'package:chilld_app/ui/mp/register_screen/register_screen.dart';
import 'package:chilld_app/widgets/custom_submit_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordChangeSuccessScreen extends StatefulWidget {
  const PasswordChangeSuccessScreen({super.key});

  @override
  State<PasswordChangeSuccessScreen> createState() => _PasswordChangeSuccessScreenState();
}

class _PasswordChangeSuccessScreenState extends State<PasswordChangeSuccessScreen> {
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
              bottom: SizeConfig.screenHeight * 0.42,
              left: 0,
              right: 0,
              child: Image.asset(
                kBoyImage,
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
                    'Password Changed!',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      color: kBlackColor,
                      //height: 0.9,
                      // letterSpacing: 5,
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    'Successful! your password has',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: kGrayColor.withOpacity(0.4),
                      //height: 0.9,
                      // letterSpacing: 5,
                    ),
                  ),
                  Text(
                    'changed click button below to continue',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: kGrayColor.withOpacity(0.4),
                      //height: 0.9,
                      // letterSpacing: 5,
                    ),
                  ),
                  Text(
                    'your account',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
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

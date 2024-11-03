import 'dart:ui';

import 'package:chilld_app/constants.dart';
import 'package:chilld_app/ui/mp/loging_screen/logging_screen.dart';
import 'package:chilld_app/widgets/custom_submit_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePassowrdDialog extends StatelessWidget {
  const ChangePassowrdDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        backgroundColor: kWhiteColor,
        surfaceTintColor: kWhiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        'Success!',
                        style: GoogleFonts.openSans(
                          color: kBlackColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Please Check Your email Inbox or Spam ',
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                  color: kGrayColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              CustomSubmitButton(
                title: 'Ok',
                color: kPrimaryBlueColor,
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoggingScreen(),
                    ),
                        (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

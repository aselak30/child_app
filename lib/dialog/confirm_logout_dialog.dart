import 'dart:ui';

import 'package:chilld_app/constants.dart';
import 'package:chilld_app/services/secure_storage_service.dart';
import 'package:chilld_app/ui/mp/loging_screen/logging_screen.dart';
import 'package:chilld_app/widgets/custom_outline_button.dart';
import 'package:chilld_app/widgets/custom_submit_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmLogoutDialog extends StatelessWidget {
  const ConfirmLogoutDialog({super.key});

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
                        'Logout',
                        style: GoogleFonts.openSans(
                          color: kBlackColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Are you sure you want to logout from the system?',
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                  color: kGrayColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 50),
              CustomSubmitButton(
                title: 'Yes',
                color: kPrimaryBlueColor,
                onTap: () {
                  SecureStorageManager().deleteAll();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoggingScreen(),
                    ),
                    (route) => false,
                  );
                },
              ),
              const SizedBox(height: 10),
              CustomOutlineButton(
                title: 'No',
                borderColor: kGrayColor,
                onTap: () {
                  Navigator.pop(context);
                },
                titleColor: kGrayColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

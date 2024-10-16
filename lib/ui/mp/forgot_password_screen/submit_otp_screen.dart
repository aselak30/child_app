import 'dart:async';

import 'package:chilld_app/constants.dart';
import 'package:chilld_app/ui/mp/forgot_password_screen/reset_password_screen.dart';
import 'package:chilld_app/widgets/custom_submit_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class SubmitOtpScreen extends StatefulWidget {
  const SubmitOtpScreen({super.key});

  @override
  State<SubmitOtpScreen> createState() => _SubmitOtpScreenState();
}

class _SubmitOtpScreenState extends State<SubmitOtpScreen> {
  String otpCode = '';
  late Timer _timer;
  int _duration = 120;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_duration == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _duration--;
          });
        }
      },
    );
  }

  void resetTimer() {
    setState(() {
      _duration = 120;
    });
    startTimer();
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: kHorizontalPadding,
            vertical: kVerticalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: kBlackColor,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Submit your OTP',
                style: GoogleFonts.openSans(
                  color: kBlackColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                'We have sent you an OTP to your email please submit the OTP.',
                style: GoogleFonts.openSans(
                  color: kGrayColor.withOpacity(0.5),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 100),
              OTPTextField(
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                 keyboardType: TextInputType.number,
                length: 4,
                width: double.infinity,
                fieldWidth: 70,
                fieldStyle: FieldStyle.box,
                style: GoogleFonts.urbanist(
                  color: kBlackColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                otpFieldStyle: OtpFieldStyle(
                  backgroundColor: kWhiteColor,
                  borderColor: kGrayColor.withOpacity(0.3),
                  enabledBorderColor: kGrayColor.withOpacity(0.3),
                  errorBorderColor: Colors.red,
                  focusBorderColor: kPrimaryBlueColor,
                ),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                onChanged: (pin) {},
                onCompleted: (pin) {
                  otpCode = pin;
                },
              ),
              const SizedBox(height: 40),
              Center(
                child: _duration != 0
                    ? GestureDetector(
                  onTap: () {
                    if (_duration == 0) {
                      resetTimer();
                    }
                  },
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Resend code in ',
                          style: GoogleFonts.inter(
                            color: kBlackColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.20,
                          ),
                        ),
                        TextSpan(
                          text: _duration.toString(),
                          style: GoogleFonts.inter(
                            color: kPrimaryBlueColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.20,
                          ),
                        ),
                        TextSpan(
                          text: ' s',
                          style: GoogleFonts.inter(
                            color: kBlackColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.20,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
                    : GestureDetector(
                  onTap: () {
                    resetTimer();
                  },
                  child: Text(
                    'Resend OTP',
                    style: GoogleFonts.inter(
                      color: kBlackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.20,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              CustomSubmitButton(
                title: 'Verify',
                color: kPrimaryBlueColor,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResetPasswordScreen(),
                    ),
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

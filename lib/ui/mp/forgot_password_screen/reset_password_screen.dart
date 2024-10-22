import 'package:chilld_app/constants.dart';
import 'package:chilld_app/ui/mp/forgot_password_screen/password_change_success_screen.dart';
import 'package:chilld_app/widgets/custom_submit_button.dart';
import 'package:chilld_app/widgets/custome_password_feild.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool validatePassword(String password) {
    RegExp regExp =
        RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{8,}$');
    return regExp.hasMatch(password) && !password.contains(' ');
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Create Password',
                          style: GoogleFonts.poppins(
                            color: kBlackColor,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'Please create a new password to reset your older one.',
                          style: GoogleFonts.poppins(
                            color: kGrayColor.withOpacity(0.5),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              'Create New Password',
                              style: GoogleFonts.poppins(
                                color: kBlackColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        CustomPasswordField(
                          controller: passwordController,
                          hintText: '**********',
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              'Confirm Password',
                              style: GoogleFonts.poppins(
                                color: kBlackColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        CustomPasswordField(
                          controller: confirmPasswordController,
                          hintText: '**********',
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Password must:',
                          style: GoogleFonts.poppins(
                            color: kGrayColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '\u2022   08 characters long',
                                style: GoogleFonts.poppins(
                                  color: kGrayColor.withOpacity(0.5),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '\u2022   01 uppercase letter',
                                style: GoogleFonts.poppins(
                                  color: kGrayColor.withOpacity(0.5),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '\u2022   01 special character',
                                style: GoogleFonts.poppins(
                                  color: kGrayColor.withOpacity(0.5),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '\u2022   01 number',
                                style: GoogleFonts.poppins(
                                  color: kGrayColor.withOpacity(0.5),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '\u2022   no spaces',
                                style: GoogleFonts.poppins(
                                  color: kGrayColor.withOpacity(0.5),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 220,
                        ),
                        CustomSubmitButton(
                          title: 'SUBMIT',
                          color: kPrimaryBlueColor,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const PasswordChangeSuccessScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

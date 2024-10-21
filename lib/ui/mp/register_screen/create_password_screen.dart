import 'package:chilld_app/constants.dart';
import 'package:chilld_app/services/auth_service.dart';
import 'package:chilld_app/widgets/custom_submit_button.dart';
import 'package:chilld_app/widgets/custome_password_feild.dart';
import 'package:chilld_app/widgets/snak_bars.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreatePasswordScreen extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String userName;
  final String email;

  const CreatePasswordScreen({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
  });

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
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
                          'Please create a new password for your account.',
                          style: GoogleFonts.poppins(
                            color: kGrayColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              'Password',
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
                                  color: kGrayColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '\u2022   01 uppercase letter',
                                style: GoogleFonts.poppins(
                                  color: kGrayColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '\u2022   01 special character',
                                style: GoogleFonts.poppins(
                                  color: kGrayColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '\u2022   01 number',
                                style: GoogleFonts.poppins(
                                  color: kGrayColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '\u2022   no spaces',
                                style: GoogleFonts.poppins(
                                  color: kGrayColor,
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
                            if (!validatePassword(passwordController.text)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                errorSnackBar(
                                    'The password you have entered does not meet the minimum security requirements'),
                              );
                            } else {
                              if (_formKey.currentState!.validate()) {
                                if (passwordController.text !=
                                    confirmPasswordController.text) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    errorSnackBar('Password do not match'),
                                  );
                                } else {
                                  Provider.of<AuthenticationService>(context,
                                          listen: false)
                                      .register(
                                          context,
                                          widget.userName,
                                          widget.email,
                                          passwordController.text,
                                          widget.firstName,
                                          widget.lastName);
                                }
                              }
                            }
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>
                            //         const RegisterSuccessScreen(),
                            //   ),
                            // );
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

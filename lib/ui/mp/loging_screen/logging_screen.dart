
import 'package:chilld_app/constants.dart';
import 'package:chilld_app/widgets/custom_submit_button.dart';
import 'package:chilld_app/widgets/custome_password_feild.dart';
import 'package:chilld_app/widgets/cutstom_email_feild.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoggingScreen extends StatefulWidget {
  const LoggingScreen({super.key});

  @override
  State<LoggingScreen> createState() => _LoggingScreenState();
}

class _LoggingScreenState extends State<LoggingScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Text(
                  'Log In',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 35,
                    color: kBlackColor,
                  ),
                ),
                Text(
                  'Log in to continue your account.',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: kGrayColor,
                  ),
                ),
                const SizedBox(height: 70),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Email Address',
                            style: GoogleFonts.poppins(
                              color: kBlackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      CustomEmailField(
                        controller: emailController,
                        hintText: 'example@gmail.com',
                        validate: true,
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
                      const SizedBox(height: 15),
                      Row(

                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {

                            },
                            child: Text(
                              'Forgot password?',
                              style: GoogleFonts.openSans(
                                color: kBlackColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 3,
                      ),
                      CustomSubmitButton(
                        title: 'Login',
                        color: kPrimaryBlueColor,
                        onTap: () {
                          // if (_formKey.currentState!.validate()) {
                          //   AuthenticationService().login(
                          //     context,
                          //     countryController.text+phoneController.text,
                          //     passwordController.text,
                          //     rememberMe,
                          //   );
                          // }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

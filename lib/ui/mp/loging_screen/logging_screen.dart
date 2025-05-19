import 'package:chilld_app/classes/language_constants.dart';
import 'package:chilld_app/constants.dart';
import 'package:chilld_app/services/auth_service.dart';
import 'package:chilld_app/ui/mp/forgot_password_screen/enter_email_screen.dart';
import 'package:chilld_app/ui/mp/loading_screen/landing_screen.dart';
import 'package:chilld_app/widgets/custom_submit_button.dart';
import 'package:chilld_app/widgets/custome_password_feild.dart';
import 'package:chilld_app/widgets/custome_text_feild.dart';
import 'package:chilld_app/widgets/snack_bars.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoggingScreen extends StatefulWidget {
  const LoggingScreen({super.key});

  @override
  State<LoggingScreen> createState() => _LoggingScreenState();
}

class _LoggingScreenState extends State<LoggingScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController usernamecontroller = TextEditingController();
  // TextEditingController countryController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LandingScreen(),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: kBlackColor,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  translation(context).log_in,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 35,
                    color: kBlackColor,
                  ),
                ),
                Text(
                  translation(context).login_to_continue,
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
                            translation(context).username,
                            style: GoogleFonts.poppins(
                              color: kBlackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: usernamecontroller,
                        hintText: 'john123',
                        // validate: true,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            translation(context).password,
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const EnterEmailScreen(),
                                ),
                              );
                            },
                            child: Text(
                              translation(context).forget_password,
                              style: GoogleFonts.poppins(
                                color: kBlackColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2.8,
                      ),
                      CustomSubmitButton(
                        title: translation(context).login,
                        color: kPrimaryBlueColor,
                        onTap: () {
                          if (usernamecontroller.text.isNotEmpty &&
                              passwordController.text.isNotEmpty) {
                            if (_formKey.currentState!.validate()) {
                              AuthenticationService().login(
                                context,
                                usernamecontroller.text,
                                passwordController.text,
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              errorSnackBar(
                                  'Enter User Name and Password, and try Again!'),
                            );
                          }

                          // if (_formKey.currentState!.validate()) {
                          //   AuthenticationService().login(
                          //     context,
                          //     countryController.text+phoneController.text,
                          //     passwordController.text,
                          //     rememberMe,
                          //   );
                          // }
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const DashBoardScreen(),
                          //   ),
                          // );
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

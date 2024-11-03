import 'package:chilld_app/classes/language_constants.dart';
import 'package:chilld_app/constants.dart';
import 'package:chilld_app/services/auth_service.dart';
import 'package:chilld_app/ui/mp/forgot_password_screen/submit_otp_screen.dart';
import 'package:chilld_app/widgets/custom_submit_button.dart';
import 'package:chilld_app/widgets/cutstom_email_feild.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EnterEmailScreen extends StatefulWidget {
  const EnterEmailScreen({super.key});

  @override
  State<EnterEmailScreen> createState() => _EnterEmailScreenState();
}

class _EnterEmailScreenState extends State<EnterEmailScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

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
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: kBlackColor,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  translation(context).enter_email,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                    color: kBlackColor,
                  ),
                ),
                Text(
                  translation(context).enter_registered_email,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
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
                            translation(context).email_address,
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 1.9,
                      ),
                      CustomSubmitButton(
                        title: translation(context).submit,
                        color: kPrimaryBlueColor,
                        onTap: () {
                          Provider.of<AuthenticationService>(context, listen: false)
                              .changePassword(context, emailController.text);
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

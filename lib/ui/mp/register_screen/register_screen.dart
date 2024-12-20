import 'package:chilld_app/classes/language_constants.dart';
import 'package:chilld_app/constants.dart';
import 'package:chilld_app/ui/mp/register_screen/create_password_screen.dart';
import 'package:chilld_app/widgets/custom_submit_button.dart';
import 'package:chilld_app/widgets/custome_text_feild.dart';
import 'package:chilld_app/widgets/cutstom_email_feild.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // TextEditingController fullNameController = TextEditingController();
  // TextEditingController nicController = TextEditingController();
  // TextEditingController contactNumberController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
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
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: kBlackColor,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  translation(context).register,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 35,
                    color: kBlackColor,
                  ),
                ),
                Text(
                  translation(context).create_new_account,
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
                            translation(context).first_name,
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
                        controller: firstNameController,
                        hintText: 'john',
                        validate: true,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            translation(context).last_name,
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
                        controller: lastNameController,
                        hintText: 'stuwart',
                        validate: true,
                      ),
                      const SizedBox(height: 20),
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
                        controller: userNameController,
                        hintText: 'jhon',
                        validate: true,
                      ),
                      const SizedBox(height: 20),
                      // Row(
                      //   children: [
                      //     Text(
                      //       'NIC Number',
                      //       style: GoogleFonts.poppins(
                      //         color: kBlackColor,
                      //         fontSize: 16,
                      //         fontWeight: FontWeight.w500,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(height: 10),
                      // CustomTextField(
                      //   controller: nicController,
                      //   hintText: '999999999V',
                      //   validate: true,
                      // ),
                      // const SizedBox(height: 20),
                      // Row(
                      //   children: [
                      //     Text(
                      //       'Contact Number',
                      //       style: GoogleFonts.poppins(
                      //         color: kBlackColor,
                      //         fontSize: 16,
                      //         fontWeight: FontWeight.w500,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(height: 10),
                      // CustomTextField(
                      //   controller: contactNumberController,
                      //   hintText: '077 77 77 777',
                      //   validate: true,
                      // ),
                      // const SizedBox(height: 15),
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
                      const SizedBox(height: 120),
                      CustomSubmitButton(
                        title: translation(context).next,
                        color: kPrimaryBlueColor,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CreatePasswordScreen(
                                  firstName: firstNameController.text,
                                  lastName: lastNameController.text,
                                  userName: userNameController.text,
                                  email: emailController.text,
                                ),
                              ),
                            );
                          }
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const CreatePasswordScreen(),
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

import 'dart:developer';

import 'package:chilld_app/classes/language_constants.dart';
import 'package:chilld_app/constants.dart';
import 'package:chilld_app/models/login_model.dart';
import 'package:chilld_app/services/edit_user_service.dart';
import 'package:chilld_app/services/secure_storage_service.dart';
import 'package:chilld_app/widgets/custom_submit_button.dart';
import 'package:chilld_app/widgets/custome_text_feild.dart';
import 'package:chilld_app/widgets/cutstom_email_feild.dart';
import 'package:chilld_app/widgets/snak_bars.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // TextEditingController fullNameController = TextEditingController();
  // TextEditingController nicController = TextEditingController();
  // TextEditingController contactNumberController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  bool rememberMe = false;
  LoginModel? user;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getLoginData();
  }

  void getLoginData() async {
    log(user.toString());
    user = await SecureStorageManager.getUser();

    setState(() {
      firstNameController.text = user!.firstName!;
      lastNameController.text = user!.lastName!;
      userNameController.text = user!.username!;
      emailController.text = user!.email!;
    });
  }

  void editLoginData(
    String email,
    String firstName,
    String lastName,
  ) async {
    setState(() {
      isLoading = true;
    });
    try {
      final editedUserdata = await EditUserService.saveEditUser(
        context,
        user!.userId!,
        email,
        firstName,
        lastName,
      );
      log(editedUserdata.toString());

      setState(() {
        user = editedUserdata;

        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        successSnackBar(editedUserdata.message!),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar('Could not complete registration, $e.'),
      );
      log(e.toString());
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: isLoading
          ? Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                size: 50,
                color: Colors.black,
              ),
              // CircularProgressIndicator(),
            )
          : SafeArea(
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
                        translation(context).edit_profile,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 35,
                          color: kBlackColor,
                        ),
                      ),
                      const SizedBox(height: 50),
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
                            const SizedBox(height: 180),
                            CustomSubmitButton(
                              title: translation(context).submit,
                              color: kPrimaryBlueColor,
                              onTap: () {
                                if (emailController.text.isNotEmpty &&
                                    firstNameController.text.isNotEmpty &&
                                    lastNameController.text.isNotEmpty) {
                                  if (_formKey.currentState!.validate()) {
                                    editLoginData(
                                        emailController.text,
                                        firstNameController.text,
                                        lastNameController.text);
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    errorSnackBar('Plese Fill the all fields.'),
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

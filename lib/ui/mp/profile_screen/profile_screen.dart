import 'package:chilld_app/classes/language.dart';
import 'package:chilld_app/classes/language_constants.dart';
import 'package:chilld_app/constants.dart';
import 'package:chilld_app/dialog/confirm_logout_dialog.dart';
import 'package:chilld_app/main.dart';
import 'package:chilld_app/ui/mp/faq_screen/faq_screen.dart';
import 'package:chilld_app/ui/mp/profile_screen/edit_profile_screen.dart';
import 'package:chilld_app/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: kHorizontalPadding,
              right: kHorizontalPadding,
              left: kHorizontalPadding,
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    kPlaceHolderImage,
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Alexander Flinch',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Email
                    const Icon(Icons.email, size: 16, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text(
                      'alex@gmail.com',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Icon(
                      Icons.phone,
                      size: 16,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '+94 77 777 7777',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditProfileScreen(),
                      ),
                    );
                  },
                  child: ProfileMenuItem(
                    iconPath: kUserIcon,
                    menuTitle: translation(context).edit_profile,
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const MyPromotionScreen(),
                    //   ),
                    // );
                  },
                  child: ProfileMenuItem(
                    iconPath: kChatIcon1,
                    menuTitle: translation(context).chat_now,
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: kWhiteColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                translation(context).language,
                                style: TextStyle(
                                  color: kBlackColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),
                              ListView(
                                shrinkWrap: true,
                                children: Language.languageList()
                                    .map(
                                      (language) => ListTile(
                                        title: Center(
                                          child: Text(
                                            language.name,
                                            style: TextStyle(
                                              color: kBlackColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        onTap: () async {
                                          Locale locale = await setLocale(
                                              language.languagecode);
                                          MyApp.setLocale(context, locale);
                                          Navigator.of(context)
                                              .pop(); // Close the bottom sheet after selection
                                        },
                                      ),
                                    )
                                    .toList(),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: ProfileMenuItem(
                    iconPath: kLanguageIcon,
                    menuTitle: translation(context).language,
                  ),
                ),

                const SizedBox(height: 20),
                // GestureDetector(
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => const MyCenterScreen(),
                //       ),
                //     );
                //   },
                //   child: ProfileMenuItem(
                //     iconPath: kProfileScreenRegisterCenterIcon,
                //     menuTitle: 'My Center',
                //   ),
                // ),
                // const SizedBox(height: 10),
                ProfileMenuItem(
                  iconPath: kSettingIcon,
                  menuTitle: translation(context).settings,
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const SettingsScreen(),
                    //   ),
                    // );
                  },
                  child: ProfileMenuItem(
                    iconPath: kContactSupportIcon,
                    menuTitle: translation(context).help_support,
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FaqScreen(),
                      ),
                    );
                  },
                  child: ProfileMenuItem(
                    iconPath: kFAQsIcon,
                    menuTitle: translation(context).faqs,
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => const ConfirmLogoutDialog(),
                    );
                  },
                  child: ProfileMenuItem(
                    iconPath: kLogOutIcon,
                    menuTitle: translation(context).log_out,
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

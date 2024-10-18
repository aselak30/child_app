import 'package:chilld_app/constants.dart';
import 'package:chilld_app/dialog/confirm_logout_dialog.dart';
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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const MyPackageScreen(),
                    //   ),
                    // );
                  },
                  child: ProfileMenuItem(
                    iconPath: kUserIcon,
                    menuTitle: 'Edit Profile',
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
                    menuTitle: 'Chat Now',
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const RegisterCenterScreen(),
                    //   ),
                    // );
                  },
                  child: ProfileMenuItem(
                    iconPath: kLanguageIcon,
                    menuTitle: 'Language',
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
                  menuTitle: 'Settings',
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
                    menuTitle: 'Help & Support',
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
                    menuTitle: 'Logout',
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

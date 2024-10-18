
import 'package:chilld_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileMenuItem extends StatelessWidget {
  final String iconPath;
  final String menuTitle;
  const ProfileMenuItem({
    super.key,
    required this.iconPath,
    required this.menuTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: kGrayColor.withOpacity(0.1),
            ),
            child: Row(
              children: [
                Image.asset(
                  iconPath,
                  color: kBlackColor,
                ),
                const SizedBox(width: 20),
                Text(
                  menuTitle,
                  style: GoogleFonts.openSans(
                    color: kBlackColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

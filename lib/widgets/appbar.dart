import 'package:chilld_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool showLeadingIcon; // Add this property

  const CustomAppBar({
    super.key,
    required this.title,
    this.showLeadingIcon = true, // Set default value to true
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.5,
      surfaceTintColor: kWhiteColor,
      backgroundColor: kWhiteColor,
      foregroundColor: kWhiteColor,
      shadowColor: kWhiteColor,
      title: Text(
        widget.title,
        style: GoogleFonts.inter(
          color: kGrayColor,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      centerTitle: true,
      leading: widget.showLeadingIcon
          ? GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: kBlackColor,
              ),
            )
          : null, // Set leading to null if showLeadingIcon is false
    );
  }
}

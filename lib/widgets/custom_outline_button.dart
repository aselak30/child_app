// ignore_for_file: must_be_immutable

import 'package:chilld_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomOutlineButton extends StatelessWidget {
  final String title;
  final Color borderColor;
  final Color titleColor;
  void Function()? onTap;

  CustomOutlineButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.borderColor,
    required this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: borderColor, width: 1.75)),
              child: Center(
                child: Text(
                  title,
                  style: GoogleFonts.inter(
                    color: titleColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

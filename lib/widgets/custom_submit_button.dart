// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSubmitButton extends StatelessWidget {
  final String title;
  final Color color;
  void Function()? onTap;
  final IconData? suffixIcon;
  CustomSubmitButton({
    super.key,
    required this.title,
    required this.color,
    required this.onTap,
    this.suffixIcon,
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
                color: color,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (suffixIcon != null)
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        Icon(
                          suffixIcon,
                          color: Colors.white,
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

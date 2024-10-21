import 'package:chilld_app/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomSearchField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  void Function(String)? onChanged;
  CustomSearchField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
  });

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
        fillColor: kWhiteColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: kGrayColor.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kGrayColor.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kGrayColor.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kGrayColor.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kGrayColor.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kGrayColor.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: kGrayColor,
        ),
        suffixIcon: Icon(
          Icons.search,
          color: kOrangeColor,
        ),
      ),
      cursorColor: kBlackColor,
      onChanged: widget.onChanged,
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}

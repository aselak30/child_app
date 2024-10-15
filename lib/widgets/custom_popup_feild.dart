// ignore_for_file: must_be_immutable

import 'package:chilld_app/constants.dart';
import 'package:flutter/material.dart';

class CustomPopUpField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  void Function()? onTap;
  final bool? validate;
  CustomPopUpField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onTap,
    this.validate,
  });

  @override
  State<CustomPopUpField> createState() => _CustomPopUpFieldState();
}

class _CustomPopUpFieldState extends State<CustomPopUpField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: kGrayColor,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kGrayColor,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kGrayColor,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kGrayColor,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kGrayColor,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kGrayColor,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: kGrayColor,
        ),
        suffixIcon: Icon(
          Icons.arrow_drop_down,
          color: kBlackColor,
        ),
      ),
      cursorColor: kGrayColor,
      readOnly: true,
      onTap: widget.onTap,
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (widget.validate != null &&
            widget.validate == true &&
            value!.isEmpty) {
          return 'Please fill this field to continue';
        } else {
          return null;
        }
      },
    );
  }
}

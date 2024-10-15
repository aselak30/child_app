import 'package:chilld_app/constants.dart';
import 'package:flutter/material.dart';

class CustomEmailField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool? validate;

  const CustomEmailField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.validate,
  }) : super(key: key);

  @override
  State<CustomEmailField> createState() => _CustomEmailFieldState();
}

class _CustomEmailFieldState extends State<CustomEmailField> {
  bool _isValidEmail = false;

  void _updateValidity(String email) {
    setState(() {
      _isValidEmail = validateEmail(email);
    });
  }

  bool validateEmail(String email) {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 18),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: kGrayColor,
          ),
          borderRadius: BorderRadius.circular(18.0),
        ),
        // Define icon based on the validity of the email
        suffixIcon: _isValidEmail
            ? Icon(
          Icons.done,
          color: kPrimaryBlueColor,
        )
            : null,
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kGrayColor.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(18.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kGrayColor.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(18.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kGrayColor.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(18.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kGrayColor.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(18.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kGrayColor.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(18.0),
        ),
        prefixIcon: Icon(
          Icons.person_2_outlined,
          color: kGrayColor.withOpacity(0.5),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: kGrayColor.withOpacity(0.5),
        ),
      ),
      cursorColor: kGrayColor,
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.emailAddress,
      onChanged: _updateValidity, // Update validity on text change
      validator: (value) {
        if (value!.isNotEmpty && !validateEmail(value)) {
          return 'Please enter a valid email';
        } else if (widget.validate != null && widget.validate == true && value.isEmpty) {
          return 'Please fill this field to continue';
        } else {
          return null;
        }
      },
    );
  }
}


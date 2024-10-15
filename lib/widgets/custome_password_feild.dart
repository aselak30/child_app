import 'package:chilld_app/constants.dart';
import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final void Function(String)? onChange;
  const CustomPasswordField({
    super.key,
    required this.controller,
    required this.hintText,
     this.onChange
  });

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool obscureText = true;

  void toggleObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 18),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: kGrayColor.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(18.0),
        ),
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
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: kGrayColor.withOpacity(0.5),
        ),
        prefixIcon: Icon(
          Icons.lock_outline,
          color: kGrayColor.withOpacity(0.5),
        ),
        suffixIcon: GestureDetector(
          onTap: toggleObscureText,
          child: Icon(
            obscureText
                ? Icons.visibility_off
                : Icons.visibility,
          ),
        ),
        suffixIconColor: kGrayColor,
      ),
      onChanged: (value) {
        if (widget.onChange != null) {
          widget.onChange!(value); // Call the onChange function
        }
      },
      cursorColor: kGrayColor,
      controller: widget.controller,
      obscureText: obscureText,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please fill this field to continue';
        } else {
          return null;
        }
      },
    );
  }
}

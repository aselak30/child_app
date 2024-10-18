import 'package:flutter/material.dart';

import '../constants.dart';

SnackBar errorSnackBar(String text) {
  return SnackBar(
    content: Text(
      text,
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.red,
  );
}

SnackBar successSnackBar(String text) {
  return SnackBar(
    content: Text(
      text,
      textAlign: TextAlign.center,
    ),
    backgroundColor: kPrimaryBlueColor,
  );
}

SnackBar processSnackBar(String text) {
  return SnackBar(
    content: Text(
      text,
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.orange,
  );
}

SnackBar detailSnackBar(String text) {
  return SnackBar(
    content: Text(
      text,
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.blue,
  );
}

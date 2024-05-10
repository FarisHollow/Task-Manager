import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const lightTeal = Color.fromRGBO(15, 147, 122, 0.8);

SvgPicture ScreenBackground(context) {
  return SvgPicture.asset(
    "assets/images/background.svg",
    width: double.infinity,
    height: double.infinity,
    fit: BoxFit.cover,
    alignment: Alignment.center,
  );
}

TextStyle HeadText1(textColor) {
  return TextStyle(
    fontFamily: "poppins",
    fontSize: 20, // Adjust font size as needed
    fontWeight: FontWeight.bold, // Adjust font weight as needed
    color: textColor,
  );
}

InputDecoration textField(label, hintText) {
  return InputDecoration(
    labelText: label,
    hintText: hintText,
    filled: true,
    fillColor: Colors.grey.shade200,
    focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.teal, width: 1)),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade200, width: 0.0)),
  );
}

InputDecoration passwordField(label, showPass) {
  return InputDecoration(
    labelText: label,
    filled: true,
    fillColor: Colors.grey.shade200,
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.teal, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade200, width: 0.0),
    ),
    suffixIcon: showPass,
  );
}

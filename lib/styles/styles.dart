import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/screens/onBoarding/email_verification_screen.dart';

const deepTeal = Color.fromRGBO(15, 147, 122, 0.8);
const deePurple = Color.fromRGBO(53, 9, 31, 0.94);
const white = Color.fromRGBO(255, 255, 255, 0.94);
const deepGreen = Color.fromRGBO(3, 183, 87, 0.94);



SvgPicture ScreenBackground(context) {
  return SvgPicture.asset(
    "assets/images/background.svg",
    width: double.infinity,
    height: double.infinity,
    fit: BoxFit.cover,
    alignment: Alignment.center,
  );
}

TextStyle HeadText1(textColor, size) {
  return TextStyle(
    fontFamily: "poppins",
    fontSize: size, // Adjust font size as needed
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

ButtonStyle button(size){

  return ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      minimumSize: size,
      backgroundColor: Colors.teal
  );
}


InkWell forgotPass(){

  return InkWell(
    onTap: () {

      Get.to(const EmailVerificationScreen());


    },
    child: const Text(
      'Forgot Password?',
      style: TextStyle(color: Colors.grey),
    ),
  );
}

PinTheme otpTheme() {
  return PinTheme(
    shape: PinCodeFieldShape.circle,
    borderRadius: BorderRadius.circular(5),
    fieldHeight: 50,
    fieldWidth: 40,
    inactiveFillColor: Colors.white,
    inactiveColor: Colors.red,
    activeColor: Colors.white,
    selectedColor: Colors.green,
    selectedFillColor: Colors.white,
    activeFillColor: Colors.white,
  );
}
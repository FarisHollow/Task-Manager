import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

SvgPicture ScreenBackground(context){

  return SvgPicture.asset("assets/images/background.svg",

    width: double.infinity,
    height: double.infinity,
    fit: BoxFit.cover,
    alignment: Alignment.center,
  );

}
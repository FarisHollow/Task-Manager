import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

SvgPicture ScreenBackground(context){

  return SvgPicture.asset("assets/images/background.svg",

    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    fit: BoxFit.fill,
    alignment: Alignment.center,
  );

}
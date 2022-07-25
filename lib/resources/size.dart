import 'package:flutter/material.dart';

class AppSize{
  static double largeButtonSize(BuildContext context){
    return MediaQuery.of(context).size.width * 4/5;
  }
  static double mediumButtonSize(BuildContext context){
    return MediaQuery.of(context).size.width * 3/5;
  }
  static double smallButtonSize(BuildContext context){
    return MediaQuery.of(context).size.width * 2/5;
  }
}
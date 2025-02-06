
import 'package:flutter/material.dart';

class ColorsHelper{
  ColorsHelper._();
  static Color? getColor (String value){
    if(value == 'Green'){
      return Colors.green;
    }
    else if(value == 'Red'){
      return Colors.red;
    }else if(value == 'Pink'){
      return Colors.pink;
    }else if(value == 'White'){
      return Colors.white;
    }
    else if(value == 'Yellow'){
      return Colors.yellow;
    }
    return null;
  }
  static const Color deepPurple = Colors.deepPurple;
  static const Color transparent = Colors.transparent;
  static const Color primaryColor = Colors.deepPurpleAccent;
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color black45 = Colors.black45;
  static const Color orangeColor = Colors.orangeAccent;
  static const Color redColor = Colors.red;
  static  Color greyColor= Colors.grey.withOpacity(0.3);
  static const Color blueColor = Colors.blue;
  static const Color nBlue = Color(0xff42446E);
  static const Color lBlue = Color(0xff3894E8);
  static const Color nBlue1 = Color(0xff6B6DD6);
  static const Color greenColor = Colors.green;
  //static const Color orangeColor = Colors.deepOrangeAccent;
// get started Page color button
static const Color gsButton = Color(0xffF83758);
static const Color viewAllColor1 = Color(0xff4392F9);
static const Color viewAllColor2 = Color(0xffFD6E87);
static const Color bSeller = Color(0xff5B9EE1);

}
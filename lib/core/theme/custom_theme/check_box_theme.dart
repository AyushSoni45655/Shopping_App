import 'package:flutter/material.dart';

class ACheckBoxTheme{
  ACheckBoxTheme._();
  static CheckboxThemeData lightCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    checkColor: WidgetStateColor.resolveWith((states){
      if(states.contains(WidgetState.selected)){
        return Colors.white;
      }
      else{
        return Colors.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states){
      if(states.contains(WidgetState.selected)){
        return Colors.blue;
      }
      else{
        return Colors.transparent;
      }
    })
  );


                                              //for the dark
  static CheckboxThemeData darkCheckBoxTheme = CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      checkColor: WidgetStateColor.resolveWith((states){
        if(states.contains(WidgetState.selected)){
          return Colors.white;
        }
        else{
          return Colors.black;
        }
      }),
      fillColor: WidgetStateProperty.resolveWith((states){
        if(states.contains(WidgetState.selected)){
          return Colors.blue;
        }
        else{
          return Colors.transparent;
        }
      })
  );



}
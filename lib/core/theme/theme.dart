import 'package:flutter/material.dart';

import 'custom_theme/app_bar_theme.dart';
import 'custom_theme/bottom_sheet_theme.dart';
import 'custom_theme/check_box_theme.dart';
import 'custom_theme/chip_theme.dart';
import 'custom_theme/custom_drawer.dart';
import 'custom_theme/elevated_button_theme.dart';
import 'custom_theme/outline_button_theme.dart';
import 'custom_theme/text_theme.dart';
import 'custom_theme/textform_field_theme.dart';


class AAppTheme {
  AAppTheme._();
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.blue,
      drawerTheme: ACustomDrawer.lightDrawer,
      brightness: Brightness.light,
      fontFamily: 'Poppins',
      textTheme: ATextTheme.lightTextTheme,
      elevatedButtonTheme: AElevatedButtonTheme.lightElevatedButtonTheme,
      appBarTheme: AAppBarTheme.lightAppBarTheme,
      chipTheme: AChipTheme.lightChipThemeData,
      outlinedButtonTheme: AOutlineButtonTheme.lightOutlineButtonTheme,
      bottomSheetTheme: ABottomSheetTheme.lightBottomSheetThemeData,
      checkboxTheme: ACheckBoxTheme.lightCheckBoxTheme,
      inputDecorationTheme: ATextFormField.lightInputDecorationTheme);
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.black,
      inputDecorationTheme: ATextFormField.darkInputDecorationTheme,
      primaryColor: Colors.blue,
      brightness: Brightness.dark,
      outlinedButtonTheme: AOutlineButtonTheme.darkOutlineButtonTheme,
      fontFamily: 'Poppins',
      chipTheme: AChipTheme.darkChipThemeData,
      textTheme: ATextTheme.darkTextTheme,
      drawerTheme: ACustomDrawer.darkDrawer,
      appBarTheme: AAppBarTheme.darkAppBarTheme,
      checkboxTheme: ACheckBoxTheme.darkCheckBoxTheme,
      bottomSheetTheme: ABottomSheetTheme.darkBottomSheetThemeData,
      elevatedButtonTheme: AElevatedButtonTheme.darkElevatedButtonTheme);
}

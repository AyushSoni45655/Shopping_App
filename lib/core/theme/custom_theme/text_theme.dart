import 'package:flutter/material.dart';

class ATextTheme{
  ATextTheme._();
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge:const TextStyle().copyWith(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.black),
    headlineMedium:  const TextStyle().copyWith(fontSize: 24,fontWeight: FontWeight.w600,color: Colors.black),
    headlineSmall: const TextStyle().copyWith( fontWeight: FontWeight.w600,fontSize: 18.0,color: Colors.black),

    titleLarge: const TextStyle().copyWith(fontSize: 16.0,fontWeight: FontWeight.w600,color: Colors.black),
    titleMedium: const TextStyle().copyWith(fontWeight: FontWeight.w500,fontSize: 16.0,color: Colors.black),
    titleSmall: const TextStyle().copyWith(fontWeight: FontWeight.w400,color: Colors.black,fontSize: 16.0),

    bodyMedium: const TextStyle().copyWith(fontWeight: FontWeight.normal,fontSize: 14,color: Colors.black),
     bodyLarge: const TextStyle().copyWith(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w500),
    bodySmall: const TextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),
  );
  static TextTheme darkTextTheme =   TextTheme(
    headlineLarge:const TextStyle().copyWith(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.white),
    headlineMedium:  const TextStyle().copyWith(fontSize: 24,fontWeight: FontWeight.w600,color: Colors.white),
    headlineSmall: const TextStyle().copyWith( fontWeight: FontWeight.w600,fontSize: 18.0,color: Colors.white),

    titleLarge: const TextStyle().copyWith(fontSize: 16.0,fontWeight: FontWeight.w600,color: Colors.white),
    titleMedium: const TextStyle().copyWith(fontWeight: FontWeight.w500,fontSize: 16.0,color: Colors.white),
    titleSmall: const TextStyle().copyWith(fontWeight: FontWeight.w400,color: Colors.white,fontSize: 16.0),

    bodyMedium: const TextStyle().copyWith(fontWeight: FontWeight.normal,fontSize: 14,color: Colors.white),
    bodyLarge: const TextStyle().copyWith(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w500),
    bodySmall: const TextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white),
  );
}
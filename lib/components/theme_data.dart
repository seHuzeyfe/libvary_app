import 'package:flutter/material.dart';
import '../constants.dart';


ThemeData theme(){
  return ThemeData(
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Color(0XFF8B8B8B)),
    ),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Muli",
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: kTextColor),
      bodyMedium: TextStyle(color: kTextColor),
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 20,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: BorderSide(color: Colors.black),
        gapPadding: 10,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: BorderSide(color: Colors.black),
        gapPadding: 10,
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
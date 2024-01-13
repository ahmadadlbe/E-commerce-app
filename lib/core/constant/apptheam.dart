import 'package:flutter/material.dart';
import 'package:store_app/core/constant/colorsapp.dart';

ThemeData englishtheme = ThemeData(
    appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.primaryappcolor),
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontFamily: "DM_Serif_Display",
          color: AppColors.primaryappcolor,
        ),
        backgroundColor: Colors.grey[50]),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryappcolor),
    fontFamily: "DM_Serif_Display",
    textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(
          fontSize: 23,
        )));
ThemeData arabictheme = ThemeData(
    appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.primaryappcolor),
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontFamily: "DM_Serif_Display",
          color: AppColors.primaryappcolor,
        ),
        backgroundColor: Colors.grey[50]),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryappcolor),
    fontFamily: "Cairo",
    textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(
          fontSize: 23,
        )));

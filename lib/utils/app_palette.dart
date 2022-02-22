import 'package:books_app/utils/hex_color.dart';
import 'package:flutter/material.dart';

class AppPalette {
  AppPalette._();

  static const fontName = 'Poppin';

  static const Color primaryBlueColor = Color(0xFF8F94FB);
  static const Color primaryBlueDark = Color(0xFF4E54CB);

  static final themeData = {
    AppTheme.lightBlueTheme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[100],
        primarySwatch: Colors.blue,
        backgroundColor: Colors.grey[100],
        primaryColor: primaryBlueDark,
        primaryColorDark: primaryBlueDark,
        primaryColorLight: primaryBlueColor,
        cardColor: Colors.white,
        shadowColor: HexColor('#eb5fed'),
        fontFamily: fontName,
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
              letterSpacing: 0.27,
              color: Color(0xFF0C233C)),
          headline2: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              letterSpacing: 0.26,
              color: Color(0xFF0C233C)),
          subtitle1: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15.0,
              letterSpacing: -0.04,
              color: Color.fromRGBO(0, 0, 0, 0.87)),
          subtitle2: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 13.0,
              letterSpacing: -0.04,
              color: Color.fromRGBO(0, 0, 0, 0.87)),
          bodyText1: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 13.0,
              color: Color(0xFF646464)),
          bodyText2: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 11.0,
              color: Color(0xFF646464)),
        ),
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
          secondary: HexColor('#FBA308'),
          secondaryVariant: HexColor('#FCB539'),
          primary: primaryBlueDark,
          primaryVariant: primaryBlueDark,
        )),
    AppTheme.darkBlueTheme: ThemeData(
        scaffoldBackgroundColor: HexColor('#222736'),
        primarySwatch: Colors.blue,
        backgroundColor: HexColor('#222736'),
        primaryColor: primaryBlueDark,
        primaryColorDark: primaryBlueDark,
        primaryColorLight: primaryBlueColor,
        cardColor: HexColor('#2a3042'),
        shadowColor: HexColor('#12263f'),
        fontFamily: fontName,
        textTheme: TextTheme(
          headline1: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
              letterSpacing: 0.27,
              color: HexColor('#bfc8e2')),
          headline2: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              letterSpacing: 0.26,
              color: HexColor('#bfc8e2')),
          subtitle1: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15.0,
              letterSpacing: -0.04,
              color: Colors.white),
          subtitle2: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 13.0,
              letterSpacing: -0.04,
              color: Colors.white),
          bodyText1: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 13.0,
              color: Color(0xFFB1A2A2)),
          bodyText2: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 11.0,
              color: Color(0xFFB1A2A2)),
        ),
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
          secondary: HexColor('#FBA308'),
          secondaryVariant: HexColor('#FCB539'),
          primary: primaryBlueDark,
          primaryVariant: primaryBlueDark,
        ))
  };
}

enum AppTheme { lightBlueTheme, darkBlueTheme, lightGreenTheme, darkGreenTheme }

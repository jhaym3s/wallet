import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hodl/configs/configs.dart';



enum DarkOption { dynamic, alwaysOn, alwaysOff }

/// Creates light and dark [ThemeData].
///
/// Default values will be derived for arguments that are omitted.
class AppTheme {
  /// Constructs an [AppTheme].
  AppTheme() {
    lightTheme = ThemeData(
      fontFamily: kFontFamily,
      brightness: Brightness.light,
      textTheme: lightModeAppTextTheme(),
      accentColor: kPrimaryColor,  
      buttonColor: kPrimaryColor,    
      primaryColor: kPrimaryColor,
      //scaffoldBackgroundColor: scaffoldBackground,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xfff5f5f5),
      ),
      //colorScheme: ColorScheme(brightness: brightness, primary: primary, onPrimary: onPrimary, secondary: secondary, onSecondary: onSecondary, error: error, onError: onError, background: background, onBackground: onBackground, surface: surface, onSurface: onSurface),
      // buttonTheme: const ButtonThemeData(
      //   textTheme: ButtonTextTheme.accent,
      //   minWidth: 88,
      //   height: 48,
      //   padding: EdgeInsets.only(left: kPaddingM, right: kPaddingM),
      //   shape: RoundedRectangleBorder(
      //     side: BorderSide(
      //       color: Color(0xff000000),
      //       width: 0,
      //       style: BorderStyle.none,
      //     ),
      //     borderRadius: BorderRadius.all(Radius.circular(kFormFieldsRadius)),
      //   ),
      //   buttonColor: kPrimaryColor,
      //   disabledColor: Color(0x61000000),
      //   highlightColor: Color(0x29000000),
      //   splashColor: Color(0x1f000000),
      //   focusColor: Color(0x1f000000),
      //   hoverColor: Color(0x0a000000),
      // ),
      appBarTheme: const AppBarTheme(
          elevation: 0,
          systemOverlayStyle:SystemUiOverlayStyle.light,
          color: Color(0xfff9fafc),
          iconTheme: IconThemeData(color: kBlack)),
      tabBarTheme: const TabBarTheme(
        labelColor: Colors.white,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: Color(0xFFF0F0F0),
        labelStyle: TextStyle(
          fontSize: 14,
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        contentPadding: EdgeInsets.only(
          top: 12,
          bottom: 12,
          left: 15,
          right: 15,
        ),
      ),
    );

    darkTheme = ThemeData(
      fontFamily: kFontFamily,
      brightness: Brightness.dark,
      //accentColor: kPrimaryColor,
      toggleableActiveColor: kPrimaryColor,
      scaffoldBackgroundColor: const Color(0xff20242b),
      cardColor: const Color(0xff2b2f38),
      bottomAppBarColor: const Color(0xff424242),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.grey[900],
      ),
      //colorScheme: ColorScheme(brightness: brightness, primary: primary, onPrimary: onPrimary, secondary: secondary, onSecondary: onSecondary, error: error, onError: onError, background: background, onBackground: onBackground, surface: surface, onSurface: onSurface),
      // buttonTheme: const ButtonThemeData(
      //   textTheme: ButtonTextTheme.accent,
      //   minWidth: 88,
      //   height: 48,
      //   padding: EdgeInsets.symmetric(horizontal: kPaddingM),
      //   shape: RoundedRectangleBorder(
      //     side: BorderSide(
      //       color: Color(0xff000000),
      //       width: 0,
      //       style: BorderStyle.none,
      //     ),
      //     borderRadius: BorderRadius.all(Radius.circular(kFormFieldsRadius)),
      //   ),
      //   buttonColor: kPrimaryColor,
      //   disabledColor: Color(0x61000000),
      //   highlightColor: Color(0x29000000),
      //   splashColor: Color(0x1f000000),
      //   focusColor: Color(0x1f000000),
      //   hoverColor: Color(0x0a000000),
      // ),
      textTheme: darkModeAppTextTheme(),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        color: Colors.grey[900],
      ),
      tabBarTheme: const TabBarTheme(
        labelColor: Colors.white,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: Color(0xff3b404b),
        labelStyle: TextStyle(
          fontSize: 14,
          color: Colors.white70,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        contentPadding: EdgeInsets.only(
          top: 12,
          bottom: 12,
          left: 15,
          right: 15,
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: Colors.grey[900],
        actionTextColor: kWhite,
        contentTextStyle: const TextStyle(
          fontSize: 14,
          color: Colors.white70,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }

  late ThemeData lightTheme;
  late ThemeData darkTheme;
}
lightModeAppTextTheme() {
  return const TextTheme(
    headline1: TextStyle(
      color: kBlack,
      fontSize: 64,
      fontFamily: kFontFamily,
      fontWeight: FontWeight.normal
    ),
    headline2: TextStyle(
      color: kBlack,
      fontFamily: kFontFamily,
      fontSize: 48,
      fontWeight: FontWeight.normal
    ),
    headline3: TextStyle(
      color:  kBlack,
      fontSize: 36,
      fontWeight: FontWeight.normal,
      fontFamily: kFontFamily,
    ),
    headline4: TextStyle(
      color:  kBlack,
      fontSize: 30,
      fontFamily: kFontFamily,
      fontWeight: FontWeight.normal
    ),
    headline5: TextStyle(
      color:  kBlack,
      fontSize: 25,
      fontFamily: kFontFamily,
      fontWeight: FontWeight.normal
    ),
    bodyText1: TextStyle(
      color:  kBlack,
      fontSize: 20,
      fontFamily: kFontFamily,
      fontWeight: FontWeight.normal
    ),
    bodyText2:TextStyle(
      color: kBlack,
      fontFamily: kFontFamily,
      fontWeight: FontWeight.normal
    ),
    
  );
}

darkModeAppTextTheme() {
  return const TextTheme(
    headline1: TextStyle(
      color: kWhite,
      fontFamily: kFontFamily,
      fontSize: 64,
      fontWeight: FontWeight.normal
    ),
    headline2: TextStyle(
      color: kWhite,
      fontSize: 48,
      fontFamily: kFontFamily,
      fontWeight: FontWeight.normal
    ),
    headline3: TextStyle(
      color: kWhite,
      fontSize: 36,
      fontFamily: kFontFamily,
      fontWeight: FontWeight.normal
    ),
    headline4: TextStyle(
      color: kWhite,
      fontSize: 30,
      fontFamily: kFontFamily,
      fontWeight: FontWeight.normal
    ),
    headline5: TextStyle(
      color:kWhite,
      fontFamily: kFontFamily,
      fontSize: 25,
      fontWeight: FontWeight.normal
    ),
    bodyText1: TextStyle(
      color:kWhite,
      fontFamily: kFontFamily,
      fontSize: 20,
      fontWeight: FontWeight.normal
    ),
    bodyText2:TextStyle(
      color:kWhite,
      fontFamily: kFontFamily,
      fontWeight: FontWeight.normal
    ),
    
  );
}
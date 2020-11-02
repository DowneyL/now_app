import "package:flutter/material.dart";
import 'package:now_app/ui/now_ui.dart' show IntFit, Window;

class NowTheme {
  /// Colors
  static const int _primaryOrange = 0xFFF96332;
  static const MaterialColor orange = MaterialColor(
    _primaryOrange,
    <int, Color>{
      50: Color(_primaryOrange),
      100: Color(_primaryOrange),
      200: Color(_primaryOrange),
      300: Color(_primaryOrange),
      400: Color(0xFFF96332),
      500: Color(_primaryOrange),
      600: Color(0xFFEB5322),
      700: Color(_primaryOrange),
      800: Color(_primaryOrange),
      900: Color(_primaryOrange),
    },
  );

  static const _defaultScaffoldBackgroundColor = Color(0xFFF2F2F2);

  /// Text
  static const String primaryFontFamily = "Montserrat";

  static TextTheme _textSize = TextTheme(
      bodyText1: TextStyle(fontSize: 16.px, fontWeight: FontWeight.w400),
      bodyText2: TextStyle(fontSize: 14.px, fontWeight: FontWeight.w400),
      button: TextStyle(fontSize: 16.px, fontWeight: FontWeight.w600),
      headline3: TextStyle(fontSize: 48.px, fontWeight: FontWeight.w600),
      headline4: TextStyle(fontSize: 40.px, fontWeight: FontWeight.w600));

  static TextTheme lightTextTheme = _textSize.merge(TextTheme(
    bodyText1: TextStyle(color: Colors.white),
    bodyText2: TextStyle(color: Colors.white),
    button: TextStyle(color: Colors.white),
    headline3: TextStyle(color: Colors.white),
    headline4: TextStyle(color: Colors.white),
  ));

  static TextTheme darkTextTheme = _textSize.merge(TextTheme(
    bodyText1: TextStyle(color: Colors.grey),
    bodyText2: TextStyle(color: Colors.grey),
    button: TextStyle(color: Colors.grey),
    headline3: TextStyle(color: Colors.grey),
    headline4: TextStyle(color: Colors.grey),
  ));

  /// Light Theme
  static ThemeData light() {
    return ThemeData(
      primarySwatch: orange,
      fontFamily: primaryFontFamily,
      textTheme: lightTextTheme,
      scaffoldBackgroundColor: _defaultScaffoldBackgroundColor,
    );
  }

  /// Dark Theme
  static ThemeData dark() {
    return ThemeData(
      primarySwatch: orange,
      fontFamily: primaryFontFamily,
      textTheme: darkTextTheme,
      scaffoldBackgroundColor: _defaultScaffoldBackgroundColor,
    );
  }

  /// Get theme
  static ThemeData theme() {
    return Window.brightness == Brightness.light ? light() : dark();
  }

  /// Get text theme
  static TextTheme textTheme() {
    return theme().textTheme;
  }
}

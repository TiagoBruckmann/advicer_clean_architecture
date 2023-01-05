// imports nativos
import 'package:flutter/material.dart';

class Themes {
  Themes._();

  // light colors
  static final Color _primaryColorLight = Colors.blueGrey.shade50;
  static final Color _primaryColorLightVariant = Colors.blueGrey.shade800;
  static final Color _onPrimaryColorLight = Colors.blueGrey.shade200;
  static const Color _textPrimaryLight = Colors.black;
  static const Color _appBarLight = Colors.blue;

  // dark colors
  static final Color _primaryColorDark = Colors.blueGrey.shade900;
  static const Color _primaryColorDarkVariant = Colors.black;
  static final Color _onPrimaryColorDark = Colors.blueGrey.shade300;
  static const Color _textPrimaryDark = Colors.white;
  static final Color _appBarDark = Colors.blueGrey.shade800;

  static const Color _iconColor = Colors.white;
  static const Color _accentColor = Color.fromRGBO(74, 217, 217, 1);

  // .*****************
  // text style - light
  // .*****************
  static const TextStyle _headingTextLight = TextStyle(
    fontWeight: FontWeight.bold,
    color: _textPrimaryLight,
    fontFamily: "Rubik",
    fontSize: 20,
  );

  static const TextStyle _bodyTextLight = TextStyle(
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
    color: _textPrimaryLight,
    fontFamily: "Rubik",
    fontSize: 16,
  );

  static const TextTheme _textThemeLight = TextTheme(
    headline1: _headingTextLight,
    bodyText1: _bodyTextLight,
  );

  // .****************
  // text style - dark
  // .****************
  static final TextStyle _headingTextDark = _headingTextLight.copyWith(color: _textPrimaryDark);
  static final TextStyle _bodyTextDark = _bodyTextLight.copyWith(color: _textPrimaryDark);

  static final TextTheme _textThemeDark = TextTheme(
    headline1: _headingTextDark,
    bodyText1: _bodyTextDark,
  );

  // .****************
  // Theme - light
  // .****************
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: _primaryColorLight,
    appBarTheme: const AppBarTheme(
      color: _appBarLight,
      iconTheme: IconThemeData(color: _iconColor),
    ),
    bottomAppBarColor: _appBarLight,
    textTheme: _textThemeLight,
    colorScheme: ColorScheme.light(
      primary: _primaryColorLight,
      onPrimary: _onPrimaryColorLight,
      secondary: _accentColor,
      primaryContainer: _primaryColorLightVariant,
    ),
  );

  // .****************
  // Theme - dark
  // .****************
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: _primaryColorDark,
    appBarTheme: AppBarTheme(
      color: _appBarDark,
      iconTheme: const IconThemeData(color: _iconColor),
    ),
    bottomAppBarColor: _appBarDark,
    textTheme: _textThemeDark,
    colorScheme: ColorScheme.light(
      primary: _primaryColorDark,
      onPrimary: _onPrimaryColorDark,
      secondary: _accentColor,
      primaryContainer: _primaryColorDarkVariant,
    ),
  );
}
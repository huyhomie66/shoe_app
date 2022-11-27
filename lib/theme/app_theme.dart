import 'package:flutter/material.dart';
import 'package:sneakerapp/theme/colors.dart';

import 'fonts.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    // ignore: prefer_const_constructors
    appBarTheme: AppBarTheme(
      elevation: 0,
      // titleTextStyle: Colors?.green,
      color: Colors.white,
      iconTheme: const IconThemeData(
        color: Colors.black12,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: CustomColors.primary,
      // onPrimary: ColorsConstant.cBlack,
    ),
    iconTheme: const IconThemeData(color: Colors.grey),
    // textTheme: _lightTextTheme,
    dividerTheme: const DividerThemeData(
      color: Colors.black12,
    ),
    // fontFamily: Fonts.fontKanit,
  );

  // static final ThemeData darkTheme = ThemeData(
  //   scaffoldBackgroundColor: ColorsConstant.cBlack,
  //   appBarTheme: const AppBarTheme(
  //     color: ColorsConstant.cBlack,
  //     iconTheme: IconThemeData(color: ColorsConstant.cWhite),
  //   ),
  //   colorScheme: const ColorScheme.dark(
  //     secondary: ColorsConstant.cWhite,
  //     onPrimary: ColorsConstant.cWhite,
  //     background: Colors.white12,
  //   ),
  //   iconTheme: const IconThemeData(
  //     color: ColorsConstant.cFF73768C,
  //   ),
  //   textTheme: _darkTextTheme,
  //   dividerTheme: const DividerThemeData(color: Colors.black),
  //   fontFamily: Fonts.fontKanit,
  // );

//   static final TextTheme _lightTextTheme = TextTheme(
//     headline1: StylesConstant.ts24wBold.copyWith(color: ColorsConstant.cBlack),
//   );

//   static final TextTheme _darkTextTheme = TextTheme(
//     headline1: StylesConstant.ts24wBold.copyWith(color: ColorsConstant.cWhite),
//   );
}

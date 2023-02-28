// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:section2/presentation/resources/color_manager.dart';
import 'package:section2/presentation/resources/font_manager.dart';
import 'package:section2/presentation/resources/styles_manager.dart';
import 'package:section2/presentation/resources/values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors for the application
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    // ripple color
    splashColor: ColorManager.primaryOpacity70,
    // will be used incase of disabled button for example
    //colorScheme: ColorManager.grey, //is decl

    // card view theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),
    // App bar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.primary,
        elevation: AppSize.s4,
        shadowColor: ColorManager.primaryOpacity70,
        titleTextStyle:
            getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16)),
    // Button theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.primaryOpacity70),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: ColorManager.white), backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),
    // Text theme
    textTheme: TextTheme(
      displayMedium: getSemiBoldStyle(
          color: ColorManager.darkGrey, fontSize: FontSize.s16),
      titleSmall:
          getMediumStyle(color: ColorManager.darkGrey, fontSize: FontSize.s14),
      bodyLarge:
          getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s14),
      labelLarge: getRegularStyle(color: ColorManager.grey1),
      bodyMedium: getRegularStyle(color: ColorManager.grey2),
    ),
    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(AppPadding.p8),
      // hint style (text form field
      hintStyle: getRegularStyle(color: ColorManager.grey1),

      //label style
      labelStyle: getMediumStyle(color: ColorManager.grey2),

      // error style
      errorStyle: getRegularStyle(color: ColorManager.error),

      //enabled border style
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        borderSide: BorderSide(color: ColorManager.lightGrey, width: AppSize.s1_5),
      ),
      // focused border
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
      ),

      // error border style
      errorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
      ),

      // error border style
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
      ),
    ),
  );
}

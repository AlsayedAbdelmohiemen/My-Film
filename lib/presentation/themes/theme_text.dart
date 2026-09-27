import 'package:flutter/material.dart';
import 'package:movie/common/constants/size_constants.dart';
import 'app_color.dart';

class ThemeText {
  const ThemeText._();

  static TextStyle get _whiteHeadline6 => const TextStyle(
        fontFamily: 'Poppins',
        fontSize: Sizes.dimen_20,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get _whiteHeadline5 => const TextStyle(
        fontFamily: 'Poppins',
        fontSize: Sizes.dimen_24,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get whiteSubtitle1 => const TextStyle(
        fontFamily: 'Poppins',
        fontSize: Sizes.dimen_16,
        color: Colors.white,
      );

  static TextStyle get _whiteButton => const TextStyle(
        fontFamily: 'Poppins',
        fontSize: Sizes.dimen_14,
        color: Colors.white,
      );

  static TextStyle get whiteBodyText2 => const TextStyle(
        fontFamily: 'Poppins',
        color: Colors.white,
        fontSize: Sizes.dimen_14,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static TextTheme getTextTheme() => TextTheme(
        headlineSmall: _whiteHeadline5,
        titleLarge: _whiteHeadline6,
        titleMedium: whiteSubtitle1,
        bodyMedium: whiteBodyText2,
        labelLarge: _whiteButton,
      );
}

extension ThemeTextExtension on TextTheme {
  TextStyle get royalBlueSubtitle1 => (titleMedium ?? const TextStyle()).copyWith(
        color: AppColor.royalBlue,
        fontWeight: FontWeight.w600,
      );

  TextStyle get greySubtitle1 => (titleMedium ?? const TextStyle()).copyWith(
        color: Colors.grey,
      );

  TextStyle get vulcanBodyText2 => (bodyMedium ?? const TextStyle()).copyWith(
        color: AppColor.vulcan,
        fontWeight: FontWeight.w600,
      );

  TextStyle get violetHeadline6 => (titleLarge ?? const TextStyle()).copyWith(
        color: AppColor.violet,
      );

  TextStyle get greyCaption => (bodySmall ?? const TextStyle()).copyWith(
        color: Colors.grey,
      );
}

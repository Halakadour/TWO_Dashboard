import 'package:flutter/material.dart';
import 'package:two_dashboard/config/theme/color.dart';

class AppTextStyle {
  static TextStyle headerLg({
    double fontSize = 28,
    Color color = Colors.black,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      decoration: decoration,
    );
  }

  static TextStyle headerMd({
    double fontSize = 24,
    Color color = Colors.black,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      decoration: decoration,
    );
  }

  static TextStyle headerSm({
    double fontSize = 20,
    Color color = Colors.black,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      decoration: decoration,
    );
  }

  static TextStyle bodyLg({
    double fontSize = 16,
    Color color = Colors.black,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      decoration: decoration,
    );
  }

  static TextStyle bodyMd({
    double fontSize = 14,
    Color color = Colors.black,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      decoration: decoration,
    );
  }

  static TextStyle bodySm({
    double fontSize = 12,
    Color color = Colors.black,
    TextDecoration? decoration,
    double? letterSpacing,
  }) {
    return TextStyle(
      color: color,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      decoration: decoration,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle bodyXs({
    double fontSize = 10,
    Color color = Colors.black,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      decoration: decoration,
    );
  }

  static TextStyle dataTableHeaderStyle({
    double fontSize = 16,
    Color color = AppColors.black,
    TextDecoration? decoration,
    double? letterSpacing,
  }) {
    return TextStyle(
      color: color,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      decoration: decoration,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle dataTableCellStyle({
    double fontSize = 14,
    Color color = AppColors.fontLightGray,
    TextDecoration? decoration,
    double? letterSpacing,
  }) {
    return TextStyle(
      color: color,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      decoration: decoration,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle buttonStyle({
    double fontSize = 12,
    Color color = Colors.black,
    TextDecoration? decoration,
    double? letterSpacing,
  }) {
    return TextStyle(
      color: color,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      decoration: decoration,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle textfieldStyle({
    double fontSize = 12,
    Color color = AppColors.fontLightGray,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      decoration: decoration,
    );
  }

  static TextStyle navRailStyle({
    double fontSize = 12,
    Color color = Colors.black,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      decoration: decoration,
    );
  }
}

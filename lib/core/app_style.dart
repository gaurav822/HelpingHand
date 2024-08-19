import 'package:flutter/material.dart';
import 'package:helpinghand/core/app_string.dart';

import 'app_color.dart';
import 'font_dimen.dart';

enum FontType { normal, medium, semibold, bold }

const List<Color> colorList = [
  Color(0xFF0EA800),
  Color(0xFFFDD835),
  Color(0xFF7CB342),
  Color(0xFF00ACC1),
  Color(0xFF673AB7),
  Color(0xFFE53935),
  Color(0xFFD81B60),
  Color(0xFF8E24AA),
  Color(0xFF3949AB),
  Color(0xFF1E88E5),
  Color(0xFF039BE5),
  Color(0xFF00ACC1),
  Color(0xFF00897B),
  Color(0xFF43A047),
  Color(0xFF7CB342),
  Color(0xFFC0CA33),
];

const focusedBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.black54, width: 2.0),
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
);

const enabledBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.black12, width: 1.0),
  borderRadius: BorderRadius.all(Radius.circular(8.0)),
);

const errorBorder = OutlineInputBorder(
  borderSide: BorderSide(width: 3, color: Colors.redAccent),
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
);

const inputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
  borderSide: BorderSide(color: Colors.redAccent),
);

const focusedErrorBorder = OutlineInputBorder(
  borderSide: BorderSide(width: 3, color: Colors.redAccent),
  borderRadius: BorderRadius.all(
    Radius.circular(10.0),
  ),
);

style36({color = ThemeColor.colorNormalText, fontType = FontType.normal}) =>
    TextStyle(
        fontSize: FontDimen.displaySmall,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// style36Medium style
/// font size: 36
/// font-family: AppString.appFont //Volte
/// fontWeight:  FontType.medium

style36Medium(
        {color = ThemeColor.colorNormalText, fontType = FontType.medium}) =>
    TextStyle(
        fontSize: FontDimen.displaySmall,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// style36Semibold style
/// font size: 36
/// font-family: AppString.appFont //Volte
/// fontWeight: FontType.semibold

style36Semibold(
        {color = ThemeColor.colorNormalText, fontType = FontType.semibold}) =>
    TextStyle(
        fontSize: FontDimen.displaySmall,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// style36Bold style
/// font size: 36
/// font-family: AppString.appFont //Volte
/// fontWeight: FontType.bold

style36Bold({color = ThemeColor.colorNormalText, fontType = FontType.bold}) =>
    TextStyle(
        fontSize: FontDimen.displaySmall,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// style32Medium style
/// font size: 32
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w500

style32Medium(
        {color = ThemeColor.colorNormalText, fontType = FontType.medium}) =>
    TextStyle(
        fontSize: FontDimen.headlineLarge,
        fontWeight: getFontWeight(fontType),
        overflow: TextOverflow.ellipsis,
        color: AppColor.getAppColor(themeColor: color),
        fontFamily: AppString.appFont);

/// style32 style
/// font size: 32
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.normal

style32({color = ThemeColor.colorNormalText, fontType = FontType.normal}) =>
    TextStyle(
        fontSize: FontDimen.headlineLarge,
        fontWeight: getFontWeight(fontType),
        overflow: TextOverflow.ellipsis,
        color: AppColor.getAppColor(themeColor: color),
        fontFamily: AppString.appFont);

/// style32Semibold style
/// font size: 32
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w600

style32Semibold(
        {color = ThemeColor.colorNormalText, fontType = FontType.semibold}) =>
    TextStyle(
        fontSize: FontDimen.headlineLarge,
        fontWeight: getFontWeight(fontType),
        overflow: TextOverflow.ellipsis,
        color: AppColor.getAppColor(themeColor: color),
        fontFamily: AppString.appFont);

/// style32bold style
/// font size: 32
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.bold

style32bold({color = ThemeColor.colorNormalText, fontType = FontType.bold}) =>
    TextStyle(
        fontSize: FontDimen.headlineLarge,
        fontWeight: getFontWeight(fontType),
        overflow: TextOverflow.ellipsis,
        color: AppColor.getAppColor(themeColor: color),
        fontFamily: AppString.appFont);

/// style28 style
/// font size: 28
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.normal

style28({color = ThemeColor.colorNormalText, fontType = FontType.normal}) =>
    TextStyle(
        fontSize: FontDimen.headlineMedium,
        fontWeight: getFontWeight(fontType),
        overflow: TextOverflow.ellipsis,
        color: AppColor.getAppColor(themeColor: color),
        fontFamily: AppString.appFont);

/// style28Medium style
/// font size: 28
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w500

style28Medium(
        {color = ThemeColor.colorNormalText, fontType = FontType.medium}) =>
    TextStyle(
        fontSize: FontDimen.headlineMedium,
        fontWeight: getFontWeight(fontType),
        overflow: TextOverflow.ellipsis,
        color: AppColor.getAppColor(themeColor: color),
        fontFamily: AppString.appFont);

/// style28Semibold style
/// font size: 28
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w600

style28Semibold(
        {color = ThemeColor.colorNormalText, fontType = FontType.semibold}) =>
    TextStyle(
        fontSize: FontDimen.headlineMedium,
        fontWeight: getFontWeight(fontType),
        overflow: TextOverflow.ellipsis,
        color: AppColor.getAppColor(themeColor: color),
        fontFamily: AppString.appFont);

/// style28Bold style
/// font size: 28
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w600

style28Bold({color = ThemeColor.colorNormalText, fontType = FontType.bold}) =>
    TextStyle(
        fontSize: FontDimen.headlineMedium,
        fontWeight: getFontWeight(fontType),
        overflow: TextOverflow.ellipsis,
        color: AppColor.getAppColor(themeColor: color),
        fontFamily: AppString.appFont);

/// style24 style
/// font size: 26
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w400

style26({color = ThemeColor.colorNormalText, fontType = FontType.normal}) =>
    TextStyle(
        fontSize: FontDimen.size26,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// style26Medium style
/// font size: 26
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w500

style26Medium(
        {color = ThemeColor.colorNormalText, fontType = FontType.medium}) =>
    TextStyle(
        fontSize: FontDimen.size26,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// style26Semibold style
/// font size: 26
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w600

style26Semibold(
        {color = ThemeColor.colorNormalText, fontType = FontType.semibold}) =>
    TextStyle(
        fontSize: FontDimen.size26,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// style26Bold style
/// font size: 26
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.bold

style26Bold({color = ThemeColor.colorNormalText, fontType = FontType.bold}) =>
    TextStyle(
        fontSize: FontDimen.size26,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// style24 style
/// font size: 24
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w400

style24({color = ThemeColor.colorNormalText, fontType = FontType.normal}) =>
    TextStyle(
        fontSize: FontDimen.headlineSmall,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// style24Medium style
/// font size: 24
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w500

style24Medium(
        {color = ThemeColor.colorNormalText, fontType = FontType.medium}) =>
    TextStyle(
        fontSize: FontDimen.headlineSmall,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// style24Semibold style
/// font size: 24
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w600

style24Semibold(
        {color = ThemeColor.colorNormalText, fontType = FontType.semibold}) =>
    TextStyle(
        fontSize: FontDimen.headlineSmall,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// style24Bold style
/// font size: 24
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.bold

style24Bold({color = ThemeColor.colorNormalText, fontType = FontType.bold}) =>
    TextStyle(
        fontSize: FontDimen.headlineSmall,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// style22 style
/// font size: 22
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w500

style22({color = ThemeColor.colorNormalText, fontType = FontType.normal}) =>
    TextStyle(
        fontSize: FontDimen.titleLarge,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// style22Medium style
/// font size: 22
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w500

style22Medium(
        {color = ThemeColor.colorNormalText, fontType = FontType.medium}) =>
    TextStyle(
        fontSize: FontDimen.titleLarge,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// style22Semibold style
/// font size: 22
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w600

style22Semibold(
        {color = ThemeColor.colorNormalText, fontType = FontType.semibold}) =>
    TextStyle(
        fontSize: FontDimen.titleLarge,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// style22Semibold style
/// font size: 22
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w700

style22Bold({color = ThemeColor.colorNormalText, fontType = FontType.bold}) =>
    TextStyle(
        fontSize: FontDimen.titleLarge,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// style20 style
/// font size: 20
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w400

style20({color = ThemeColor.colorNormalText, fontType = FontType.normal}) =>
    TextStyle(
        fontSize: FontDimen.titleMedium20,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// style20Medium style
/// font size: 20
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w500

style20Medium(
        {color = ThemeColor.colorNormalText, fontType = FontType.medium}) =>
    TextStyle(
        fontSize: FontDimen.titleMedium20,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// style20Semibold style
/// font size: 20
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w600

style20Semibold(
        {color = ThemeColor.colorNormalText, fontType = FontType.semibold}) =>
    TextStyle(
        fontSize: FontDimen.titleMedium20,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// style20Bold style
/// font size: 20
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w700

style20Bold({color = ThemeColor.colorNormalText, fontType = FontType.bold}) =>
    TextStyle(
        fontSize: FontDimen.titleMedium20,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// style16 style
/// font size: 16
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w400

style16({color = ThemeColor.colorNormalText, fontType = FontType.normal}) =>
    TextStyle(
        fontSize: FontDimen.titleMedium,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// style16Medium style
/// font size: 16
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w500

style16Medium(
        {color = ThemeColor.colorNormalText, fontType = FontType.medium}) =>
    TextStyle(
        fontSize: FontDimen.titleMedium,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// style16Semibold style
/// font size: 16
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w600

style16Semibold(
        {color = ThemeColor.colorNormalText, fontType = FontType.semibold}) =>
    TextStyle(
        fontSize: FontDimen.titleMedium,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// style16Bold style
/// font size: 16
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w700

style16Bold({color = ThemeColor.colorNormalText, fontType = FontType.bold}) =>
    TextStyle(
        fontSize: FontDimen.titleMedium,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// style14 style
/// font size: 14
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w400

style14({color = ThemeColor.colorNormalText, fontType = FontType.normal}) =>
    TextStyle(
        fontSize: FontDimen.titleSmall,
        color: AppColor.getAppColor(themeColor: color),
        fontWeight: getFontWeight(fontType),
        fontFamily: AppString.appFont);

/// style14 style
/// font size: 14
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w500

style14Medium(
        {color = ThemeColor.colorNormalText, fontType = FontType.medium}) =>
    TextStyle(
        fontSize: FontDimen.titleSmall,
        color: AppColor.getAppColor(themeColor: color),
        fontWeight: getFontWeight(fontType),
        fontFamily: AppString.appFont);

/// style14Semibold style
/// font size: 14
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w600

style14Semibold(
        {color = ThemeColor.colorNormalText, fontType = FontType.semibold}) =>
    TextStyle(
        fontSize: FontDimen.titleSmall,
        color: AppColor.getAppColor(themeColor: color),
        fontWeight: getFontWeight(fontType),
        fontFamily: AppString.appFont);

/// style14Bold style
/// font size: 14
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w700

style14Bold({color = ThemeColor.colorNormalText, fontType = FontType.bold}) =>
    TextStyle(
        fontSize: FontDimen.titleSmall,
        color: AppColor.getAppColor(themeColor: color),
        fontWeight: getFontWeight(fontType),
        fontFamily: AppString.appFont);

/// style14Overflow style
/// font size: 14
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w500

style14Overflow(
        {color = ThemeColor.colorNormalText, fontType = FontType.normal}) =>
    TextStyle(
        fontSize: FontDimen.labelLarge,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// style12 style
/// font size: 12
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w400

style12({color = ThemeColor.colorNormalText, fontType = FontType.normal}) =>
    TextStyle(
        fontSize: FontDimen.labelMedium,
        fontWeight: getFontWeight(fontType),
        overflow: TextOverflow.ellipsis,
        color: AppColor.getAppColor(themeColor: color),
        fontFamily: AppString.appFont);

/// style12Medium style
/// font size: 12
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w500

style12Medium(
        {color = ThemeColor.colorNormalText, fontType = FontType.medium}) =>
    TextStyle(
        fontSize: FontDimen.labelMedium,
        fontWeight: getFontWeight(fontType),
        overflow: TextOverflow.ellipsis,
        color: AppColor.getAppColor(themeColor: color),
        fontFamily: AppString.appFont);

/// style12Semibold style
/// font size: 12
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w600

style12Semibold(
        {color = ThemeColor.colorNormalText, fontType = FontType.semibold}) =>
    TextStyle(
        fontSize: FontDimen.labelMedium,
        fontWeight: getFontWeight(fontType),
        overflow: TextOverflow.ellipsis,
        color: AppColor.getAppColor(themeColor: color),
        fontFamily: AppString.appFont);

/// style12Bold style
/// font size: 12
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w700

style12Bold({color = ThemeColor.colorNormalText, fontType = FontType.bold}) =>
    TextStyle(
        fontSize: FontDimen.labelMedium,
        fontWeight: getFontWeight(fontType),
        overflow: TextOverflow.ellipsis,
        color: AppColor.getAppColor(themeColor: color),
        fontFamily: AppString.appFont);

/// style11 style
/// font size: 11
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w400

style11({color = ThemeColor.colorNormalText, fontType = FontType.normal}) =>
    TextStyle(
        fontSize: FontDimen.labelSmall,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// style11Medium style
/// font size: 11
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w500

style11Medium(
        {color = ThemeColor.colorNormalText, fontType = FontType.medium}) =>
    TextStyle(
        fontSize: FontDimen.labelSmall,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// style11Semibold style
/// font size: 11
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w600

style11Semibold(
        {color = ThemeColor.colorNormalText, fontType = FontType.semibold}) =>
    TextStyle(
        fontSize: FontDimen.labelSmall,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// style11Bold style
/// font size: 11
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w700

style11Bold({color = ThemeColor.colorNormalText, fontType = FontType.bold}) =>
    TextStyle(
        fontSize: FontDimen.labelSmall,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// style10 style
/// font size: 10
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w400

style10({color = ThemeColor.colorNormalText, fontType = FontType.normal}) =>
    TextStyle(
        fontSize: FontDimen.size10,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        fontFamily: AppString.appFont);

/// style10Medium style
/// font size: 10
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w500

style10Medium(
        {color = ThemeColor.colorNormalText, fontType = FontType.medium}) =>
    TextStyle(
        fontSize: FontDimen.size10,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        fontFamily: AppString.appFont);

/// style10Semibold style
/// font size: 10
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w600

style10Semibold(
        {color = ThemeColor.colorNormalText, fontType = FontType.semibold}) =>
    TextStyle(
        fontSize: FontDimen.size10,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        fontFamily: AppString.appFont);

/// style10Bold style
/// font size: 10
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w700

style10Bold({color = ThemeColor.colorNormalText, fontType = FontType.bold}) =>
    TextStyle(
        fontSize: FontDimen.size10,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        fontFamily: AppString.appFont);

/// labelSmall style
/// font size: 11
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w400

Button16SemiboldWhite(
        {color = ThemeColor.whiteColor, fontType = FontType.semibold}) =>
    TextStyle(
        fontSize: FontDimen.titleMedium,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// labelSmall style
/// font size: 11
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w400

Button14SemiboldWhite(
        {color = ThemeColor.whiteColor, fontType = FontType.semibold}) =>
    TextStyle(
        fontSize: FontDimen.titleSmall,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// labelSmall style
/// font size: 11
/// font-family: AppString.appFont //Volte
/// fontWeight: FontType.semibold

Button12SemiboldWhite(
        {color = ThemeColor.whiteColor, fontType = FontType.semibold}) =>
    TextStyle(
        fontSize: FontDimen.labelMedium,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

///Meterial3
///****************************************************************************

//Text Styles
/// displayLarge style
/// font size 57
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w400

displayLarge(
        {color = ThemeColor.colorNormalText, fontType = FontType.normal}) =>
    TextStyle(
        fontSize: FontDimen.displayLarge,
        fontWeight: getFontWeight(fontType),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont,
        color: color);

/// displayMedium style
/// font size: 45 // Use for web
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w400

displayMedium(
        {color = ThemeColor.colorNormalText, fontType = FontType.normal}) =>
    TextStyle(
        fontSize: FontDimen.displayMedium,
        fontWeight: getFontWeight(fontType),
        overflow: TextOverflow.ellipsis,
        color: AppColor.getAppColor(themeColor: color),
        fontFamily: AppString.appFont);

/// displaySmall style
/// font size: 36
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w400

displaySmall(
        {color = ThemeColor.colorNormalText, fontType = FontType.semibold}) =>
    TextStyle(
        fontSize: FontDimen.displaySmall,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// headLineLarge style
/// font size: 32
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w400

headLineLarge(
        {color = ThemeColor.colorNormalText, fontType = FontType.normal}) =>
    TextStyle(
        fontSize: FontDimen.headlineLarge,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// headLineLarge style
/// font size: 32
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w400

headlineMedium(
        {color = ThemeColor.colorNormalText, fontType = FontType.normal}) =>
    TextStyle(
        fontSize: FontDimen.headlineMedium,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// headlineSmall style
/// font size: 24
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w400

headlineSmall(
        {color = ThemeColor.colorNormalText, fontType = FontType.normal}) =>
    TextStyle(
        fontSize: FontDimen.headlineSmall,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// titleLarge style
/// font size: 22
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w400

titleLarge({color = ThemeColor.colorNormalText, fontType = FontType.normal}) =>
    TextStyle(
        fontSize: FontDimen.titleLarge,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        fontFamily: AppString.appFont);

/// titleMedium style
/// font size: 16
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w600

titleMedium({color = ThemeColor.colorNormalText, fontType = FontType.semibold}) =>
    TextStyle(
        fontSize: FontDimen.titleMedium,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// titleSmall style
/// font size: 14
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w600

titleSmall({color = ThemeColor.colorNormalText, fontType = FontType.semibold}) =>
    TextStyle(
        fontSize: FontDimen.titleSmall,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// labelLarge style
/// font size: 14
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w600

labelLarge({color = ThemeColor.colorNormalText, fontType = FontType.semibold}) =>
    TextStyle(
        fontSize: FontDimen.labelLarge,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// labelMedium style
/// font size: 12
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w500

labelMedium({color = ThemeColor.colorNormalText, fontType = FontType.medium}) =>
    TextStyle(
        fontSize: FontDimen.labelMedium,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// labelSmall style
/// font size: 11
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w600

labelSmall({color = ThemeColor.whiteColor, fontType = FontType.semibold}) =>
    TextStyle(
        fontSize: FontDimen.labelSmall,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// bodyLarge style
/// font size: 16
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w400

bodyLarge({color = ThemeColor.colorNormalText, fontType = FontType.medium}) =>
    TextStyle(
        fontSize: FontDimen.bodyLarge,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        overflow: TextOverflow.ellipsis,
        fontFamily: AppString.appFont);

/// bodyMedium style
/// font size: 14
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w400

bodyMedium({color = ThemeColor.colorNormalText, fontType = FontType.normal}) =>
    TextStyle(
        fontSize: FontDimen.bodyMedium,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        fontFamily: AppString.appFont);

/// bodyMedium style
/// font size: 12
/// font-family: AppString.appFont //Volte
/// fontWeight: FontWeight.w500

bodySmall({color = ThemeColor.colorNormalText, fontType = FontType.medium}) =>
    TextStyle(
        fontSize: FontDimen.bodySmall,
        fontWeight: getFontWeight(fontType),
        color: AppColor.getAppColor(themeColor: color),
        fontFamily: AppString.appFont);

FontWeight getFontWeight(FontType type) {
  switch (type) {
    case FontType.normal:
      return FontWeight.normal;
    case FontType.medium:
      return FontWeight.w500;
    case FontType.semibold:
      return FontWeight.w600;
    case FontType.bold:
      return FontWeight.bold;
    default:
      return FontWeight.normal;
  }
}

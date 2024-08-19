import 'dart:ui';

import 'colors/dark_theme_color.dart';
import 'colors/light_theme_color.dart';

class AppColor {
  AppColor._();

  static bool isDarkTheme = false;

  static Color getAppColor({required ThemeColor themeColor}) {
    switch (themeColor) {
      case ThemeColor.colorPrimary:
        return isDarkTheme ? DarkThemeColor.colorPrimaryDark : LightThemeColor.colorPrimaryDark;

      case ThemeColor.colorPrimaryDark:
        return isDarkTheme ? DarkThemeColor.colorPrimaryDark : LightThemeColor.colorPrimaryDark;

      case ThemeColor.colorPrimaryBlue:
        return isDarkTheme ? DarkThemeColor.colorPrimaryBlue : LightThemeColor.colorPrimaryBlue;

      case ThemeColor.colorAccent:
        return isDarkTheme ? DarkThemeColor.colorAccent : LightThemeColor.colorAccent;
      case ThemeColor.colorSecondaryText:

        return isDarkTheme ? DarkThemeColor.colorSecondaryText : LightThemeColor.colorSecondaryText;

      case ThemeColor.colorBlueBorder:
        return isDarkTheme ? DarkThemeColor.colorBlueBorder : LightThemeColor.colorBlueBorder;

      case ThemeColor.colorHintText:
        return isDarkTheme ? DarkThemeColor.colorHintText : LightThemeColor.colorHintText;

      case ThemeColor.colorRed:
        return isDarkTheme ? DarkThemeColor.colorRed : LightThemeColor.colorRed;

      case ThemeColor.colorNormalText:
        return isDarkTheme ? DarkThemeColor.colorNormalText : LightThemeColor.colorNormalText;

      case ThemeColor.visaCardColor:
        return isDarkTheme ? DarkThemeColor.visaCardColor : LightThemeColor.visaCardColor;

      case ThemeColor.dividerColor:
        return isDarkTheme ? DarkThemeColor.dividerColor : LightThemeColor.dividerColor;

      case ThemeColor.backgroundColor:
        return isDarkTheme ? DarkThemeColor.backgroundColor : LightThemeColor.backgroundColor;

      case ThemeColor.whiteColor:
        return isDarkTheme ? DarkThemeColor.whiteColor : LightThemeColor.whiteColor;

      case ThemeColor.navigationButtonColor:
        return isDarkTheme ? DarkThemeColor.navigationButtonColor : LightThemeColor.navigationButtonColor;

      case ThemeColor.colorPhoneBlue:
        return isDarkTheme ? DarkThemeColor.colorPhoneBlue : LightThemeColor.colorPhoneBlue;

      case ThemeColor.colorWhiteText:
        return isDarkTheme ? DarkThemeColor.colorWhiteText : LightThemeColor.colorWhiteText;

      case ThemeColor.colorGreyColor:
        return isDarkTheme ? DarkThemeColor.colorGreyColor : LightThemeColor.colorGreyColor;

      case ThemeColor.colorLightGrey:
        return isDarkTheme ? DarkThemeColor.colorLightGrey : LightThemeColor.colorLightGrey;

      case ThemeColor.colorGreenText:
        return isDarkTheme ? DarkThemeColor.colorGreenText : LightThemeColor.colorGreenText;

      case ThemeColor.colorRedButtonBackground:
        return isDarkTheme ? DarkThemeColor.colorRedButtonBackground : LightThemeColor.colorRedButtonBackground;

      default:
        return isDarkTheme ? DarkThemeColor.colorPrimary : LightThemeColor.colorPrimary;
    }
  }
}

enum ThemeColor {
  colorPrimary,
  colorPrimaryDark,
  colorPrimaryBlue,
  colorAccent,
  colorSecondaryText,
  colorBlueBorder,
  colorHintText,
  colorRed,
  colorNormalText,
  dividerColor,
  visaCardColor,
  backgroundColor,
  whiteColor,
  navigationButtonColor,
  colorPhoneBlue,
  colorWhiteText,
  colorGreyColor,
  colorLightGrey,
  colorGreenText,
  colorRedButtonBackground
}

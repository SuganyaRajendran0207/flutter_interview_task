import 'package:flutter/material.dart';

// ignore_for_file: public_member_api_docs

class ThemedColor extends Color {
  ///
  /// Color for dark theme
  ///
  final int darkColor;

  ///
  /// Color for light theme
  ///
  final int lightColor;

  ///
  /// Color for dark theme
  ///
  final ThemeMode defaultThemeMode;

  ///
  /// Constructor
  ///
  const ThemedColor({
    required this.darkColor,
    required this.lightColor,
    this.defaultThemeMode = ThemeMode.light,
  }) : super(defaultThemeMode == ThemeMode.light ? lightColor : darkColor);

  const ThemedColor.light(int value)
      : lightColor = value,
        darkColor = value,
        defaultThemeMode = ThemeMode.light,
        super(value);

  const ThemedColor.dark(int value)
      : lightColor = value,
        darkColor = value,
        defaultThemeMode = ThemeMode.dark,
        super(value);

  ///
  /// Get color from context
  ///
  Color ofContext(BuildContext context) {
    return ofBrightness(MediaQuery.of(context).platformBrightness);
  }

  ///
  /// Get color from context
  ///
  Color ofBrightness(Brightness brightness) {
    final ThemeMode themeMode =
        brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
    return of(themeMode);
  }

  ///
  /// Color for [themeMode]
  ///
  Color of(ThemeMode themeMode) => Color(valueOf(themeMode));

  ///
  /// Value for [themeMode]
  ///
  int valueOf(ThemeMode themeMode) =>
      themeMode == ThemeMode.light ? lightColor : darkColor;
}

// Here lies default colors of the application
class AppColors {
  // Basic colors
  static final ThemedColor backgroundColor =
      ThemedColor(lightColor: 0xffFFFFFF, darkColor: 0xffFFFFFF);
  static final ThemedColor onBackgroundColor =
      ThemedColor(lightColor: 0xff212121, darkColor: 0xff212121);
  static final ThemedColor onBackgroundColorTwo =
      ThemedColor(lightColor: 0xff212121, darkColor: 0xff212121);
  static final ThemedColor scaffoldColor =
      ThemedColor(lightColor: 0xFFFFFFFF, darkColor: 0xFFFFFFFF);

  static final ThemedColor surfaceColor =
      ThemedColor(lightColor: 0xFFFFFFFF, darkColor: 0xFFFFFFFF);
  static final ThemedColor onSurfaceColor =
      ThemedColor(lightColor: 0xff212121, darkColor: 0xff212121);
  static final ThemedColor shadowColor =
      ThemedColor(lightColor: 0xff111111, darkColor: 0xff111111);

  // Text Color
  static final ThemedColor textColor = onBackgroundColor;
  static final ThemedColor headingColor = onBackgroundColor;
  static final ThemedColor subtitleColor =
      ThemedColor(lightColor: 0xffA0A0A0, darkColor: 0xffA0A0A0);
  static final ThemedColor buttonColor = backgroundColor;
  static final ThemedColor onButtonColor = onBackgroundColor;
  static final ThemedColor iconColor = onBackgroundColor;

  static const Color primaryColor = Color(0xFFff0000);
  static const Color primaryVariantColor = Color(0xFFd10000);
  static const Color onPrimaryColor = Color(0xFFFFFFFF);
  static const Color onPrimaryVariantColor = Color(0xFFFFFFFF);

  static const Color secondaryColor = Color(0xFFED786A);
  static const Color secondaryVariantColor = Color(0xFFCF5E50);
  static const Color onSecondaryColor = Color(0xFFFFFFFF);
  static const Color onSecondaryVariantColor = Color(0xFFFFFFFF);

  static const Color primaryButtonColor = primaryColor;
  static const Color onPrimaryButtonColor = onPrimaryColor;

  static const Color secondaryButtonColor = secondaryColor;
  static const Color onSecondaryButtonColor = onSecondaryColor;

  static const Color errorColor = Color(0xFFD22B2B);
  static const Color onErrorColor = Color(0xFFFFFFFF);

  // Widget colors
  static final ThemedColor statusBarColor =
      ThemedColor.light(Colors.transparent.value);
  static final ThemedColor navigationBarColor = surfaceColor;
  static final ThemedColor appBarColor = surfaceColor;
  static final ThemedColor onAppBarColor = textColor;
  static final ThemedColor appBarIconColor = iconColor;

  static final Color dividerColor = onSurfaceColor;
  static final Color barrierColor = primaryVariantColor.withOpacity(0.3);
  static final Color trackColor = onBackgroundColor.withOpacity(
      0.3); // Color used for Switch, Slider, ProgressIndicator value
  static final Color trackBackgroundColor = secondaryColor.withOpacity(
      0.5); // Color used for Switch, Slider, ProgressIndicator background
  static const Color disableColor = Color(
      0xFF808080); // Color used disable/desactivate for Switch, Slider, ProgressIndicator value
  static final Color disableBackgroundColor = disableColor.withOpacity(
      0.5); // Color used disable/desactivate for Switch, Slider, ProgressIndicator background

  // TextFields
  static const ThemedColor textfieldOutlineBackgroundColor =
      ThemedColor.light(0xFFFFFFFF);
  static const ThemedColor textfieldUnderlineBackgroundColor =
      ThemedColor.light(0x0F000000);
  static final ThemedColor textfieldOutlineBorderColor =
      ThemedColor(darkColor: 0xFFeeeeee, lightColor: 0xFFeeeeee);
  static final ThemedColor textfieldUnderlineBorderColor =
      ThemedColor(darkColor: 0xFF7e7e7e, lightColor: 0xFF7e7e7e);
  static final ThemedColor hintColor =
      ThemedColor(darkColor: 0x98284898, lightColor: 0x98284898);
  static final ThemedColor fillColor =
      ThemedColor(darkColor: 0xffeeeffb, lightColor: 0xffeeeffb);
  static final ThemedColor labelColor =
      ThemedColor(darkColor: 0xFF7e7e7e, lightColor: 0xFF7e7e7e);

  // Bottom navigation bar
  static final ThemedColor bottomNavigationBarColor = surfaceColor;
  static final ThemedColor bottomNavigationBarSelectedItemColor =
      ThemedColor(lightColor: 0xFF00ccc0, darkColor: 0xFF00ccc0);
  static final ThemedColor bottomNavigationBarUnselectedItemColor =
      ThemedColor(lightColor: 0xFF284898, darkColor: 0xFF284898);

  static final ThemedColor dialogColor = surfaceColor;
  static final ThemedColor dialogTitleColor =
      ThemedColor(lightColor: 0xFF000000, darkColor: 0xFF000000);
  static final ThemedColor dialogTextColor =
      ThemedColor(lightColor: 0xFF7e7e7e, darkColor: 0xFF7e7e7e);
  static final ThemedColor dialogButtonColor =
      ThemedColor(lightColor: 0xFFea4330, darkColor: 0xFFea4330);
  static final ThemedColor modalColor = surfaceColor;
  static final ThemedColor onModalColor = onSurfaceColor;
  static final ThemedColor drawerColor = surfaceColor;
  static final ThemedColor onDrawerColor = onSurfaceColor;

  static final ThemedColor chipBorderColor =
      ThemedColor.light(Colors.transparent.value);
  static final ThemedColor fabBorderColor =
      ThemedColor.light(Colors.transparent.value);
  static final ThemedColor cardBorderColor =
      ThemedColor.light(Colors.transparent.value);
  static final ThemedColor dialogBorderColor =
      ThemedColor.light(Colors.transparent.value);
  static final ThemedColor drawerBorderColor =
      ThemedColor.light(Colors.transparent.value);
  static final ThemedColor drawerBottomBorderColor =
      ThemedColor.light(Colors.transparent.value);
  static final ThemedColor drawerRightBorderColor =
      ThemedColor.light(Colors.transparent.value);
  static final ThemedColor modalBorderColor =
      ThemedColor.light(Colors.transparent.value);

  // AppBar
  static final ThemedColor appBarTitleColor =
      ThemedColor(lightColor: 0xFF00ccc0, darkColor: 0xFF00ccc0);
  static final ThemedColor expandedAppBarTitleColor =
      ThemedColor(lightColor: 0xFF00ccc0, darkColor: 0xFF00ccc0);
}

// Here lies custom colors of the application
class CustomColors extends AppColors {
  static const Color greenColor = Color(0xFF2DC76D);
  static const Color greyColor = Color(0xFF7E7E7E);
  static const Color greyLiteColor = Color(0xFFB8B8B8);
  static const Color limeColor = Color(0xFFE0FFFF);
}

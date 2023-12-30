import 'dart:ui';

import '../itheme/iTheme.dart';

class DarkModeTheme extends ITheme {
  @override
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @override
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @override
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  @override
  late Color primary = const Color(0xFF00A6FB);
  @override
  late Color secondary = const Color(0xFF53C6FF);
  @override
  late Color tertiary = const Color(0xFF0095DF);
  @override
  late Color alternate = const Color(0xFF1E2830);
  @override
  late Color primaryText = const Color(0xFFFFFFFF);
  @override
  late Color secondaryText = const Color(0xFF8B97A2);
  @override
  late Color primaryBackground = const Color(0xFF1A1F24);
  @override
  late Color secondaryBackground = const Color(0xFF111417);
  @override
  late Color accent1 = const Color(0xFFEEEEEE);
  @override
  late Color accent2 = const Color(0xFFE0E0E0);
  @override
  late Color accent3 = const Color(0xFF757575);
  @override
  late Color accent4 = const Color(0xFF616161);
  @override
  late Color success = const Color(0xFF04A24C);
  @override
  late Color warning = const Color(0xFFFCDC0C);
  @override
  late Color error = const Color(0xFFE21C3D);
  @override
  late Color info = const Color(0xFF1C4494);

  @override
  late Color background = const Color(0xFF1A1F24);
  @override
  late Color darkBackground = const Color(0xFF111417);
  @override
  late Color textColor = const Color(0xFFFFFFFF);
  @override
  late Color grayDark = const Color(0xFF57636C);
  @override
  late Color grayLight = const Color(0xFF8B97A2);
  @override
  late Color errorRed = const Color(0xFFF06A6A);
  @override
  late Color primaryBtnText = const Color(0xFFFFFFFF);
  @override
  late Color lineColor = const Color(0xFF22282F);
  @override
  late Color btnText = const Color(0xFFFFFFFF);
  @override
  late Color customColor3 = const Color(0xFFDF3F3F);
  @override
  late Color customColor4 = const Color(0xFF090F13);
  @override
  late Color white = const Color(0xFFFFFFFF);
  @override
  late Color backgroundComponents = const Color(0xFF1D2428);
  @override
  late Color primary600 = const Color(0xFF336A4A);
  @override
  late Color secondary600 = const Color(0xFF6D604A);
  @override
  late Color tertiary600 = const Color(0xFF0C2533);
  @override
  late Color darkBGstatic = const Color(0xFF0D1E23);
  @override
  late Color secondary30 = const Color(0x4D928163);
  @override
  late Color overlay0 = const Color(0x000B191E);
  @override
  late Color overlay = const Color(0xB20B191E);
  @override
  late Color primary30 = const Color(0x4D4B986C);
  @override
  late Color customColor1 = const Color(0xFF452FB7);
  @override
  late Color grayIcon = const Color(0xFF95A1AC);
  @override
  late Color gray200 = const Color(0xFFDBE2E7);
  @override
  late Color gray600 = const Color(0xFF262D34);
  @override
  late Color black600 = const Color(0xFF090F13);
  @override
  late Color tertiary400 = const Color(0xFF39D2C0);
  @override
  late Color noColor = const Color(0x000F1113);
  @override
  late Color pictonBlue = const Color(0xFF00A6FB);
  @override
  late Color deepSkyBlue = const Color(0xFF53C6FF);
  @override
  late Color celestialBlue = const Color(0xFF0095DF);
  @override
  late Color richBlack = const Color(0xFF020D13);
}

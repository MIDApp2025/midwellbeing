// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';

SharedPreferences? _prefs;

abstract class FlutterFlowTheme {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();

  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static FlutterFlowTheme of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? DarkModeTheme()
        : LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color custom;
  late Color customColor1;
  late Color customColor2;
  late Color customColor3;
  late Color customColor4;
  late Color customColor5;
  late Color customColor6;
  late Color customColor7;
  late Color customColor8;

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  bool get displayLargeIsCustom => typography.displayLargeIsCustom;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  bool get displayMediumIsCustom => typography.displayMediumIsCustom;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  bool get displaySmallIsCustom => typography.displaySmallIsCustom;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  bool get headlineLargeIsCustom => typography.headlineLargeIsCustom;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  bool get headlineMediumIsCustom => typography.headlineMediumIsCustom;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  bool get headlineSmallIsCustom => typography.headlineSmallIsCustom;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  bool get titleLargeIsCustom => typography.titleLargeIsCustom;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  bool get titleMediumIsCustom => typography.titleMediumIsCustom;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  bool get titleSmallIsCustom => typography.titleSmallIsCustom;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  bool get labelLargeIsCustom => typography.labelLargeIsCustom;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  bool get labelMediumIsCustom => typography.labelMediumIsCustom;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  bool get labelSmallIsCustom => typography.labelSmallIsCustom;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  bool get bodyLargeIsCustom => typography.bodyLargeIsCustom;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  bool get bodyMediumIsCustom => typography.bodyMediumIsCustom;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  bool get bodySmallIsCustom => typography.bodySmallIsCustom;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF94B5D8);
  late Color secondary = const Color(0xFF7F8C8D);
  late Color tertiary = const Color(0xFFF1C40F);
  late Color alternate = const Color(0xD8E4E6EB);
  late Color primaryText = const Color(0xFF14181B);
  late Color secondaryText = const Color(0xFF57636C);
  late Color primaryBackground = const Color(0xFFFFFFFF);
  late Color secondaryBackground = const Color(0xFFF1F4F8);
  late Color accent1 = const Color(0xFFF00A3C);
  late Color accent2 = const Color(0xFF30B94D);
  late Color accent3 = const Color(0xFFFFFFFF);
  late Color accent4 = const Color(0xFFE4E6EB);
  late Color success = const Color(0xFFFFFFFF);
  late Color warning = const Color(0xFFE5D1D3);
  late Color error = const Color(0xFFC6E7EE);
  late Color info = const Color(0xFFFFFFFF);

  late Color custom = const Color(0xCC94B5D8);
  late Color customColor1 = const Color(0xFFE4E6EB);
  late Color customColor2 = const Color(0xFFFFFFFF);
  late Color customColor3 = const Color(0xFFE4E6EB);
  late Color customColor4 = const Color(0xFF14181B);
  late Color customColor5 = const Color(0xFF4299E1);
  late Color customColor6 = const Color(0xDC57636C);
  late Color customColor7 = const Color(0xFFA7B4BA);
  late Color customColor8 = const Color(0xB794B5D8);
}

abstract class Typography {
  String get displayLargeFamily;
  bool get displayLargeIsCustom;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  bool get displayMediumIsCustom;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  bool get displaySmallIsCustom;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  bool get headlineLargeIsCustom;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  bool get headlineMediumIsCustom;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  bool get headlineSmallIsCustom;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  bool get titleLargeIsCustom;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  bool get titleMediumIsCustom;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  bool get titleSmallIsCustom;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  bool get labelLargeIsCustom;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  bool get labelMediumIsCustom;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  bool get labelSmallIsCustom;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  bool get bodyLargeIsCustom;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  bool get bodyMediumIsCustom;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  bool get bodySmallIsCustom;
  TextStyle get bodySmall;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Inter Tight';
  bool get displayLargeIsCustom => false;
  TextStyle get displayLarge => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 64.0,
      );
  String get displayMediumFamily => 'Inter Tight';
  bool get displayMediumIsCustom => false;
  TextStyle get displayMedium => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 44.0,
      );
  String get displaySmallFamily => 'Inter Tight';
  bool get displaySmallIsCustom => false;
  TextStyle get displaySmall => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 36.0,
      );
  String get headlineLargeFamily => 'Inter Tight';
  bool get headlineLargeIsCustom => false;
  TextStyle get headlineLarge => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 32.0,
      );
  String get headlineMediumFamily => 'Inter';
  bool get headlineMediumIsCustom => false;
  TextStyle get headlineMedium => GoogleFonts.inter(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 28.0,
      );
  String get headlineSmallFamily => 'Inter Tight';
  bool get headlineSmallIsCustom => false;
  TextStyle get headlineSmall => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 24.0,
      );
  String get titleLargeFamily => 'Inter Tight';
  bool get titleLargeIsCustom => false;
  TextStyle get titleLarge => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 20.0,
      );
  String get titleMediumFamily => 'Inter Tight';
  bool get titleMediumIsCustom => false;
  TextStyle get titleMedium => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 18.0,
      );
  String get titleSmallFamily => 'Inter Tight';
  bool get titleSmallIsCustom => false;
  TextStyle get titleSmall => GoogleFonts.interTight(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 16.0,
      );
  String get labelLargeFamily => 'Inter';
  bool get labelLargeIsCustom => false;
  TextStyle get labelLarge => GoogleFonts.inter(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get labelMediumFamily => 'Inter';
  bool get labelMediumIsCustom => false;
  TextStyle get labelMedium => GoogleFonts.inter(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get labelSmallFamily => 'Inter';
  bool get labelSmallIsCustom => false;
  TextStyle get labelSmall => GoogleFonts.inter(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
  String get bodyLargeFamily => 'Inter';
  bool get bodyLargeIsCustom => false;
  TextStyle get bodyLarge => GoogleFonts.inter(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get bodyMediumFamily => 'Inter';
  bool get bodyMediumIsCustom => false;
  TextStyle get bodyMedium => GoogleFonts.inter(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodySmallFamily => 'Inter';
  bool get bodySmallIsCustom => false;
  TextStyle get bodySmall => GoogleFonts.inter(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
}

class DarkModeTheme extends FlutterFlowTheme {
  DarkModeTheme() {
    // 🎨 Määritellään täysin peittävät Web-värit vastaamaan mobiilin läpinäkyvyyttä

    // POHJAVÄRIT
    const Color webBaseBackground = Color(0xFF121212);     // Ultra tumma tausta (Pohja)
    
    // UUDET KONTRASTISÄVYT WEBILLE
    // 1. Primary/Aktiivinen tila
    const Color webPrimaryActive = Color(0xFF7890AA);      // Keski-sinertävä harmaa (Kontrastinen)
    // 2. Accent3/Scaffold pohja
    const Color webAccent3Simulated = Color(0xFF212C3A);   // Tumma, sinertävä laattaharmaa (Scaffold)
    // 3. Accent4/Kortin tausta
    const Color webAccent4Simulated = Color(0xFF3A4456);   // Neutraali tumma slate-harmaa (Kortin tausta)
    
    // 4. Secondary/Alternate Elementit (KORJAUS)
    const Color webSecondaryElements = Color(0xFFE0E0E0);  // KORJAUS: Vaalea harmaa (secondary elementit/pinnat)
    const Color webAlternateElements = Color(0xFFFFFFFF);  // KORJAUS: Täysi valkoinen (alternate/dividerit/ei-aktiiviset ikonit)
    
    // 5. Secondary Text
    const Color webSecondaryTextHighContrast = Color(0xFFFFFFFF); // Täysin valkoinen teksti
    
    // CUSTOM-VÄRI KORJAUKSILLE
    const Color webCustom1Simulated = Color(0xFF4D5561);   // Vaaleampi Dropdown-tausta (customColor1)
    const Color webCustom6Simulated = Color(0xFF5A6678);   // Vaaleampi Nappi-tausta (customColor6)

    // Muut simuloinnit
    const Color webSuccessSimulated = Color(0xFF3A4456);   // Success (0x00FFFFFF) simuloi nyt kortin taustaa
    const Color webWhiteText = Color(0xFFFFFFFF);


    if (kIsWeb) {
      // 🌐 Web-versio: Täysin peittävät värit, jotka takaavat kontrastin
      
      // PÄÄVÄRIT JA AKTIIVISET TILAT
      primary = webPrimaryActive;                         // Aktiivinen tila (Nav-bar, valittu tila)
      secondary = webSecondaryElements;                   // KORJATTU: Vaalea elementin väri (jos etusivun teksti käyttää tätä)
      tertiary = const Color(0xFFFFD54F);                 // Keltainen
      alternate = webAlternateElements;                   // KORJATTU: Täysin valkoinen (ei-aktiiviset ikonit, dividerit)
      
      // TEKSTIVÄRIT
      primaryText = webWhiteText;
      secondaryText = webSecondaryTextHighContrast;       // Täysin valkoinen teksti
      
      // TAUSTAT JA POHJAT
      primaryBackground = webBaseBackground;              // Pohja: Erittäin tumma
      secondaryBackground = webAccent4Simulated;          // Korttien/toissijaisten taustojen pinta
      
      // ACCENTIT
      accent1 = const Color(0xFFEF5350);
      accent2 = const Color(0xFF66BB6A);
      accent3 = webAccent3Simulated;                      // Scaffold pohja (Tumma sinertävä harmaa)
      accent4 = webAccent4Simulated;                      // Korttien tausta (Neutraali slate-harmaa)
      success = webSuccessSimulated;                      // Simuloitu kortin tausta
      warning = const Color(0xFFF9CF58);
      error = const Color(0xFFFF5963);
      info = webWhiteText;
      
      // CUSTOM VÄRIT (Simuloidaan sinun käsin asetetut arvot)
      custom = webPrimaryActive;                          // Vastaa primaryn peittävyyttä
      customColor1 = webCustom1Simulated;                 // Vaaleampi Dropdown
      customColor2 = const Color(0xFF3A444E);
      customColor3 = const Color(0xFFE4E6EB);
      customColor4 = webWhiteText;
      customColor5 = const Color(0xFF4299E1);
      customColor6 = webCustom6Simulated;                 // Vaaleampi Nappi
      customColor7 = const Color(0xFF6B7280);             // Jäljellä oleva harmaa (custom7)
      customColor8 = webPrimaryActive;                    // Vastaa primaryn peittävyyttä

    } else {
      // 🔹 iOS + Android – alkuperäinen versio
      primary = const Color(0xB794B5D8);
      secondary = const Color(0xFFE3E3E3);
      tertiary = const Color(0xFFFFD54F);
      alternate = const Color(0x89E9E3E3);
      primaryText = const Color(0xFFFFFFFF);
      secondaryText = const Color(0xFFB0B0B0);
      primaryBackground = const Color(0xFF202124);
      secondaryBackground = const Color(0x1B94B5D8);
      accent1 = const Color(0xFFEF5350);
      accent2 = const Color(0xFF66BB6A);
      accent3 = const Color(0x3994B5D8);
      accent4 = const Color(0x3094B5D8);
      success = const Color(0x00FFFFFF);
      warning = const Color(0xFFF9CF58);
      error = const Color(0xFFFF5963);
      info = const Color(0xFFFFFFFF);
      custom = const Color(0xCC94B5D8);
      customColor1 = const Color(0xFF3A444E);
      customColor2 = const Color(0xFF3A444E);
      customColor3 = const Color(0xCDE4E6EB);
      customColor4 = const Color(0xFFFFFFFF);
      customColor5 = const Color(0xFF4299E1);
      customColor6 = const Color(0x3994B5D8);
      customColor7 = const Color(0x89E9E3E3);
      customColor8 = const Color(0xB794B5D8);
    }
  }
}


extension TextStyleHelper on TextStyle {
  TextStyle override({
    TextStyle? font,
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = false,
    TextDecoration? decoration,
    double? lineHeight,
    List<Shadow>? shadows,
    String? package,
  }) {
    if (useGoogleFonts && fontFamily != null) {
      font = GoogleFonts.getFont(fontFamily,
          fontWeight: fontWeight ?? this.fontWeight,
          fontStyle: fontStyle ?? this.fontStyle);
    }

    return font != null
        ? font.copyWith(
            color: color ?? this.color,
            fontSize: fontSize ?? this.fontSize,
            letterSpacing: letterSpacing ?? this.letterSpacing,
            fontWeight: fontWeight ?? this.fontWeight,
            fontStyle: fontStyle ?? this.fontStyle,
            decoration: decoration,
            height: lineHeight,
            shadows: shadows,
          )
        : copyWith(
            fontFamily: fontFamily,
            package: package,
            color: color,
            fontSize: fontSize,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            decoration: decoration,
            height: lineHeight,
            shadows: shadows,
          );
  }
}



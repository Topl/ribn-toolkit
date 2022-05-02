import 'package:flutter/material.dart';
import 'package:ribn_toolkit/constants/colors.dart';

/// The custom [TextStyle]s being used in the app.
class RibnToolkitTextStyles {
  RibnToolkitTextStyles._();
  static const TextStyle h1 = TextStyle(
    fontFamily: 'DM Sans',
    fontSize: 32,
    fontWeight: FontWeight.w500,
    color: RibnColors.defaultText,
    height: 1.57,
  );
  static const TextStyle h2 = TextStyle(
    fontFamily: 'DM Sans',
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: RibnColors.defaultText,
    height: 1.34,
  );
  static const TextStyle h3 = TextStyle(
    fontFamily: 'DM Sans',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: RibnColors.defaultText,
  );
  static const TextStyle h4 = TextStyle(
    fontFamily: 'DM Sans',
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle body1 = TextStyle(
    fontFamily: 'DM Sans',
    fontSize: 12,
    color: RibnColors.defaultText,
    height: 2.67,
  );
  static const TextStyle body1Bold = TextStyle(
    fontFamily: 'DM Sans',
    fontSize: 26.59,
    color: RibnColors.defaultText,
    fontWeight: FontWeight.w500,
    height: 1.2,
  );
  static const TextStyle smallBoldLabel = TextStyle(
    fontFamily: 'DM Sans',
    fontSize: 13,
    color: RibnColors.defaultText,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  );

  static const TextStyle extH2 = TextStyle(
    fontFamily: 'DM Sans',
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle extH3 = TextStyle(
    fontFamily: 'DM Sans',
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle hintStyle = TextStyle(
    fontFamily: 'DM Sans',
    fontSize: 12,
    color: RibnColors.hintTextColor,
  );

  static const TextStyle btnLarge = TextStyle(
    fontFamily: 'DM Sans',
    fontSize: 19.6,
    color: RibnColors.accent,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle btnMedium = TextStyle(
    fontFamily: 'DM Sans',
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle dropdownButtonStyle = TextStyle(
    color: RibnColors.whiteBackground,
    fontWeight: FontWeight.w500,
    fontFamily: 'DM Sans',
    fontSize: 12,
  );

  static const TextStyle smallBody = TextStyle(
    color: RibnColors.defaultText,
    fontWeight: FontWeight.w400,
    fontFamily: 'DM Sans',
    fontSize: 12.0,
    decoration: TextDecoration.none,
  );

  static const TextStyle settingsSmallText = TextStyle(
    fontSize: 9.3,
    fontWeight: FontWeight.w400,
    fontFamily: 'DM Sans',
    color: Color(0xFF585858),
  );

  static const TextStyle toolTipTextStyle = TextStyle(
    color: RibnColors.defaultText,
    fontWeight: FontWeight.w400,
    fontFamily: 'DM Sans',
    fontSize: 12,
    decoration: TextDecoration.none,
  );

  static const TextStyle assetShortNameStyle = TextStyle(
    fontFamily: 'DM Sans',
    fontWeight: FontWeight.w500,
    fontSize: 15,
    color: RibnColors.defaultText,
  );

  static const TextStyle assetLongNameStyle = TextStyle(
    fontFamily: 'DM Sans',
    fontSize: 12,
    color: Color(0xff585858),
  );
}

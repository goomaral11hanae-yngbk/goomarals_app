import 'package:flutter/material.dart';

class AppConstants {
  //  Colors
  static const Color primaryColor = Color(0xFF4A6572);
  static const Color secondaryColor = Color(0xFFF9AA33);
  static const Color backgroundColor = Colors.white;
  static const Color textColor = Colors.black;
  static const Color greyColor = Colors.grey;
  static const Color lightGreyColor = Color(0xFFF5F5F5);
  static const Color successColor = Color(0xFF4CAF50);
  static const Color errorColor = Color(0xFFF44336);

  //  Paddings & Spacings
  static const double defaultPadding = 16.0;
  static const double defaultRadius = 12.0;
  static const double defaultMargin = 12.0;
  static const double appBarHeight = 56.0;

  //  Animations
  static const Duration defaultAnimationDuration = Duration(milliseconds: 300);
  static const Curve defaultCurve = Curves.easeInOut;

  //  Shadows
  static const List<BoxShadow> defaultShadow = [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 8,
      offset: Offset(0, 2),
    ),
  ];

  // Text Styles
  static const TextStyle headingStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: textColor,
  );

  static const TextStyle subHeadingStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: textColor,
  );

  static const TextStyle bodyStyle = TextStyle(
    fontSize: 16,
    height: 1.6,
    color: Colors.black54,
  );

  static const TextStyle smallTextStyle = TextStyle(
    fontSize: 14,
    color: Colors.black45,
  );

  //  Images
  static const String defaultImage =
      "https://via.placeholder.com/300x300.png?text=No+Image";

  //  App Info
  static const String appName = "Jewelry Shop";
  static const String version = "1.0.0";
  static const String developer = "Your Name / Studio";

  // Currency
  static const String currencySymbol = "\$";

  //  API / Links
  static const String apiBaseUrl = "https://api.yourshop.com";
  static const String privacyPolicyUrl = "https://yourshop.com/privacy";
  static const String termsOfUseUrl = "https://yourshop.com/terms";
}

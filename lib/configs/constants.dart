import 'package:flutter/material.dart';

// typedef ToolbarOptionModelCallback = void Function(ToolbarOptionModel sortModel);

const String kAppName = 'Hodl';
const String kAppVersion = '1.0.0';

/// Default theme font.
///
/// Use null for system font or font name declared in pubspec.yaml like Roboto
/// or Raleway.
const String kFontFamily = "Quicksand";

// Date/time formats
const String kDateFormat = 'dd/MM/yyyy';
const String kDateTimeFormat = 'dd/MM/yyyy HH:mm';
const String kTimeFormat = 'HH:mm';

// Various Sizes
const double kBottomBarIconSize = 32.0;
const double kBoxDecorationRadius = 8.0;
const double kFormFieldsRadius = 6.0;
const double kRoundedButtonRadius = 24.0;
const double kCardRadius = 24.0;
const double kBadgeRadius = 16.0;
const double kTimelineDateSize = 88.0;
const double kBorderRadius = 10.0;
const double kBottomNavBarHeight = 60.0;

// Colors
const Color kPrimaryColor = Color(0xFF0E34A0);
const Color kSecondaryColor = Color(0xFF20A7C3);
const Color kWhite = Color(0xFFFFFFFF);
const Color kBlack = Color(0xFF000000);
const Color kDanger = Color(0xFFE22B23);
const Color kGrey = Color(0xFF666666);
const Color kInfo = Color(0xFF069AD6);
const Color kWarning = Color(0xFFED9E03);
const Color kTransparent = Colors.transparent;
const Color kSuccess = Color(0xFF57CE7E);
const LinearGradient kSweetchLinearColors = LinearGradient(colors: [Color(0xFF524EB6),Color(0xFF7B61FF),Color(0xFF20A7C3), Color(0xFF20A7C3)]);

// Padding
const double kPaddingS = 10.0;
const double kPaddingM = 20.0;
const double kPaddingL = 40.0;

// Avatar sizes
const double kCircleAvatarSizeRadiusAppBar = 20.0;
const double kCircleAvatarSizeRadiusSmall = 24.0;
const double kCircleAvatarSizeRadiusLarge = 48.0;

// Animations
const Duration kRippleAnimationDuration = Duration(milliseconds: 600);
const Duration kButtonAnimationDuration = Duration(milliseconds: 200);
const Duration kPaymentCardAnimationDuration = Duration(milliseconds: 500);


/// Minimal query string length.
const int kMinimalNameQueryLength = 3;

/// Minimal password string length.
const int kMinimalPasswordLength = 7;

/// SnackBar duration in miliseconds (short).
const int kSnackBarDurationShort = 2500;

/// SnackBar duration in miliseconds (long).
const int kSnackBarDurationLong = 10000;

/// Default locale.
const Locale kDefaultLocale = Locale('en');

/// Review comment length limit.
const int kReviewLengthLimit = 400;

/// Terms of service URL.
const String kTermsOfServiceURL = '';

/// Privacy policy URL.
const String kPrivacyPolicyURL = '';

/// Template homepage URL.
const String kHomepageURL = '';

double kScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double kScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

/// Password match regex string.
/* r'^
  (?=.*[A-Z])       // should contain at least one upper case
  (?=.*[a-z])       // should contain at least one lower case
  (?=.*?[0-9])      // should contain at least one digit
  (?=.*?[!@#\$&*~]) // should contain at least one Special character
  .{8,}             // Must be at least 8 characters in length  
$
*/ 
bool validateStructure(String value){
        String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
        RegExp regExp = RegExp(pattern);
        return regExp.hasMatch(value);
  }
const String kPasswordRegex = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

/// Demo account email address.
const String kDemoEmail = 'admin@example.com';

/// Demo account password.
const String kDemoPassword = 'Password1';

/// Currency used in the application.
const String kCurrency = 'NGN';

/// Logz.io Token for remote logging.
/// Settings > General > Account Settings
const String kLogzioToken = 'flqmcXGLTlkodgJqPSpNpFCblcRQvukD';

/// Logz.io remote Url.
/// This largely depends which region you selected during registration.
const String kLogzioUrl = 'https://listener-uk.logz.io:8071/';

/// Assets images
class AssetsImages {
  static const homeIcon = "assets/images/home_icon.png";
  static const swapIcon = "assets/images/swap_icon.png";
  static const walletIcon = "assets/images/wallet_icon.png";
  static const settingsIcon = "assets/images/settings_icon.png";
  static const logoAndName ="assets/images/logo_and_text.png";
}

/// Preference keys used to store/read values using [AppPreferences].
class PreferenceKey {
  static const String appVersion = 'appVersion';
  static const String isOnboarded = 'isOnboarded';
  static const String user = 'user';
  static const String notification = 'notification';
  static const String darkOption = 'darkOption';
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Astanovka';

  @override
  String get placesTab => 'Places';

  @override
  String get profileTab => 'Profile';

  @override
  String get interestingPlaces => 'Interesting places this month';

  @override
  String get categoryAll => 'All';

  @override
  String get categoryRestaurants => 'Restaurants';

  @override
  String get categoryParks => 'Parks';

  @override
  String get categoryMuseums => 'Museums';

  @override
  String get signIn => 'Sign In';

  @override
  String get createAccount => 'Create Account';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get emailRequired => 'Email is required';

  @override
  String get emailInvalid => 'Enter a valid email';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get passwordMin => 'Minimum 6 characters';

  @override
  String get pleaseWait => 'Please wait...';

  @override
  String get alreadyHaveAccount => 'Already have an account? Sign in';

  @override
  String get noAccountRegister => 'No account? Register';

  @override
  String get loginSubtitleRegister =>
      'Create an account to save favorite places.';

  @override
  String get loginSubtitleSignIn =>
      'Sign in to see your profile and favorites.';

  @override
  String get signedInAs => 'Signed in as';

  @override
  String get noEmail => 'No email';

  @override
  String get signOut => 'Sign Out';

  @override
  String get favoritePlaces => 'Favorite Places';

  @override
  String get noFavorites => 'No favorites yet. Add some places to favorites.';

  @override
  String get notSignedIn => 'You are not signed in.';

  @override
  String get goToLogin => 'Go to Login';

  @override
  String get signInToAddFavorites => 'Sign in to add favorites';

  @override
  String get authError => 'Auth error';

  @override
  String get retry => 'Retry';

  @override
  String favoritesError(Object error) {
    return 'Favorites error: $error';
  }

  @override
  String get remove => 'Remove';

  @override
  String get about => 'About';

  @override
  String get map2gis => 'Map (2GIS)';

  @override
  String get mapNotSupportedWeb =>
      '2GIS map widget is not supported on Web. Run on Android/iOS.';
}

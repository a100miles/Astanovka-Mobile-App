// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kazakh (`kk`).
class AppLocalizationsKk extends AppLocalizations {
  AppLocalizationsKk([String locale = 'kk']) : super(locale);

  @override
  String get appTitle => 'Astanovka';

  @override
  String get placesTab => 'Орындар';

  @override
  String get profileTab => 'Профиль';

  @override
  String get interestingPlaces => 'Осы айдағы қызықты орындар';

  @override
  String get categoryAll => 'Барлығы';

  @override
  String get categoryRestaurants => 'Мейрамханалар';

  @override
  String get categoryParks => 'Саябақтар';

  @override
  String get categoryMuseums => 'Мұражайлар';

  @override
  String get signIn => 'Кіру';

  @override
  String get createAccount => 'Тіркелу';

  @override
  String get email => 'Пошта';

  @override
  String get password => 'Құпиясөз';

  @override
  String get emailRequired => 'Пошта міндетті';

  @override
  String get emailInvalid => 'Дұрыс поштаны енгізіңіз';

  @override
  String get passwordRequired => 'Құпиясөз міндетті';

  @override
  String get passwordMin => 'Кемінде 6 таңба';

  @override
  String get pleaseWait => 'Күтіңіз...';

  @override
  String get alreadyHaveAccount => 'Аккаунтыңыз бар ма? Кіру';

  @override
  String get noAccountRegister => 'Аккаунт жоқ па? Тіркелу';

  @override
  String get loginSubtitleRegister =>
      'Таңдаулы орындарды сақтау үшін аккаунт жасаңыз.';

  @override
  String get loginSubtitleSignIn =>
      'Профиль мен таңдаулыларды көру үшін кіріңіз.';

  @override
  String get signedInAs => 'Сіз кірдіңіз:';

  @override
  String get noEmail => 'Пошта жоқ';

  @override
  String get signOut => 'Шығу';

  @override
  String get favoritePlaces => 'Таңдаулы орындар';

  @override
  String get noFavorites =>
      'Әзірге таңдаулылар жоқ. Орындарды таңдаулыға қосыңыз.';

  @override
  String get notSignedIn => 'Сіз аккаунтқа кірмедіңіз.';

  @override
  String get goToLogin => 'Кіруге өту';

  @override
  String get signInToAddFavorites => 'Таңдаулыға қосу үшін кіріңіз';

  @override
  String get authError => 'Авторизация қатесі';

  @override
  String get retry => 'Қайта көру';

  @override
  String favoritesError(Object error) {
    return 'Таңдаулы қатесі: $error';
  }

  @override
  String get remove => 'Өшіру';

  @override
  String get about => 'Сипаттама';

  @override
  String get map2gis => 'Карта (2GIS)';

  @override
  String get mapNotSupportedWeb =>
      'Web нұсқасында 2GIS карта жоқ. Android/iOS-та іске қосыңыз.';
}

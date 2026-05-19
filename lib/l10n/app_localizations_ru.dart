// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Astanovka';

  @override
  String get placesTab => 'Места';

  @override
  String get profileTab => 'Профиль';

  @override
  String get interestingPlaces => 'Интересные места месяца';

  @override
  String get categoryAll => 'Все';

  @override
  String get categoryRestaurants => 'Рестораны';

  @override
  String get categoryParks => 'Парки';

  @override
  String get categoryMuseums => 'Музеи';

  @override
  String get signIn => 'Вход';

  @override
  String get createAccount => 'Регистрация';

  @override
  String get email => 'Почта';

  @override
  String get password => 'Пароль';

  @override
  String get emailRequired => 'Почта обязательна';

  @override
  String get emailInvalid => 'Введите корректную почту';

  @override
  String get passwordRequired => 'Пароль обязателен';

  @override
  String get passwordMin => 'Минимум 6 символов';

  @override
  String get pleaseWait => 'Подождите...';

  @override
  String get alreadyHaveAccount => 'Уже есть аккаунт? Войти';

  @override
  String get noAccountRegister => 'Нет аккаунта? Зарегистрироваться';

  @override
  String get loginSubtitleRegister =>
      'Создайте аккаунт, чтобы сохранять избранные места.';

  @override
  String get loginSubtitleSignIn =>
      'Войдите, чтобы видеть профиль и избранное.';

  @override
  String get signedInAs => 'Вы вошли как';

  @override
  String get noEmail => 'Нет почты';

  @override
  String get signOut => 'Выйти';

  @override
  String get favoritePlaces => 'Избранные места';

  @override
  String get noFavorites => 'Пока нет избранных. Добавьте места в избранное.';

  @override
  String get notSignedIn => 'Вы не вошли в аккаунт.';

  @override
  String get goToLogin => 'Перейти к входу';

  @override
  String get signInToAddFavorites => 'Войдите, чтобы добавлять в избранное';

  @override
  String get authError => 'Ошибка авторизации';

  @override
  String get retry => 'Повторить';

  @override
  String favoritesError(Object error) {
    return 'Ошибка избранного: $error';
  }

  @override
  String get remove => 'Удалить';

  @override
  String get about => 'Описание';

  @override
  String get map2gis => 'Карта (2GIS)';

  @override
  String get mapNotSupportedWeb =>
      'Веб-версия не поддерживает 2GIS карту. Запустите на Android/iOS.';
}

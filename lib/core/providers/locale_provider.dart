import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocaleNotifier extends Notifier<Locale> {
  @override
  Locale build() {
    return const Locale('en'); // Default to English
  }

  void changeLocale(String languageCode) {
    final normalized = languageCode == 'kz' ? 'kk' : languageCode;
    state = Locale(normalized);
  }
}

final localeProvider = NotifierProvider<LocaleNotifier, Locale>(LocaleNotifier.new);

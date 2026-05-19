import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/locale_provider.dart';

class LanguageSwitcher extends ConsumerWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);

    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: locale.languageCode,
        icon: const Icon(Icons.language, color: Colors.green),
        items: const [
          DropdownMenuItem(
            value: 'en',
            child: Text('EN', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ),
          DropdownMenuItem(
            value: 'ru',
            child: Text('RU', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ),
          DropdownMenuItem(
            value: 'kk',
            child: Text('KZ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ),
        ],
        onChanged: (value) {
          if (value == null) return;
          ref.read(localeProvider.notifier).changeLocale(value);
        },
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/locale_provider.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Dummy data for your UI testing
    final List<String> dummyPlaces = List.generate(10, (index) => 'Place ${index + 1}');
    final currentLocale = ref.watch(localeProvider);
    final String languageValue = currentLocale.languageCode.toUpperCase();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Astanovka', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.green)),
        centerTitle: false,
        actions: [
          // Language Selector
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: DropdownButton<String>(
              value: ['EN', 'RU', 'KZ'].contains(languageValue) ? languageValue : 'EN',
              icon: const Icon(Icons.language, color: Colors.green),
              underline: const SizedBox(), // Clean, minimalist look without the underline
              items: ['EN', 'RU', 'KZ'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  ref.read(localeProvider.notifier).changeLocale(newValue.toLowerCase());
                }
              },
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Your city guide',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Interesting places this month',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.separated(
                itemCount: dummyPlaces.length,
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 0,
                    color: Colors.grey.shade50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: Colors.grey.shade200),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        // TODO: Use context.go('/places/${place.id}') when sub-routes are ready
                        debugPrint('Tapped ${dummyPlaces[index]}');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Image Placeholder
                          SizedBox(
                            height: 150,
                            child: Container(
                              color: Colors.green.shade50,
                              child: const Icon(Icons.place, color: Colors.green, size: 40),
                            ),
                          ),
                          // Title Area
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              dummyPlaces[index],
                              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black87),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

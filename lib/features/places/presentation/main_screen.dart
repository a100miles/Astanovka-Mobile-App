import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/providers/locale_provider.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  final List<Map<String, dynamic>> categories = [
    {'name': 'All', 'icon': Icons.apps},
    {'name': 'Restaurants', 'icon': Icons.restaurant},
    {'name': 'Parks', 'icon': Icons.park},
    {'name': 'Museums', 'icon': Icons.museum},
  ];
  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Dummy data for your UI testing
    final List<String> dummyPlaces = List.generate(10, (index) => 'Place ${index + 1}');
    final currentLocale = ref.watch(localeProvider);
    final String languageValue = currentLocale.languageCode.toUpperCase();
    final softRed = Colors.red.shade400;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Astanovka',
          style: GoogleFonts.getFont(
            'Badeen Display',
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: Colors.green,
          ),
        ),
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
          const SizedBox(height: 16),
          // Horizontal Categories
          SizedBox(
            height: 40,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final isSelected = selectedCategoryIndex == index;
                final category = categories[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategoryIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? softRed : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isSelected ? softRed : Colors.grey.shade200,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          category['icon'],
                          size: 18,
                          color: isSelected ? Colors.white : Colors.black87,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          category['name'],
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black87,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
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
            child: ListView.separated(
              // Add padding at the bottom so the last item isn't hidden by the glass nav bar
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 100.0),
              itemCount: dummyPlaces.length,
              separatorBuilder: (context, index) => const SizedBox(height: 24),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Material(
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {
                          // TODO: Use context.go('/places/${place.id}') when sub-routes are ready
                          debugPrint('Tapped ${dummyPlaces[index]}');
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Immersive Image
                            Stack(
                              children: [
                                SizedBox(
                                  height: 250,
                                  width: double.infinity,
                                  child: Container(
                                    color: Colors.green.shade50,
                                    child: const Icon(Icons.landscape, color: Colors.green, size: 60),
                                  ),
                                ),
                                Positioned(
                                  top: 16,
                                  right: 16,
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withValues(alpha: 0.9),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.favorite_border,
                                      color: Colors.black87,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // Title Area
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      dummyPlaces[index],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 20,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.star, color: Colors.amber.shade400, size: 20),
                                      const SizedBox(width: 4),
                                      const Text(
                                        '4.8',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

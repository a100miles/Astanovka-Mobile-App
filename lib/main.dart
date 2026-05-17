import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/router/app_router.dart';
import 'core/providers/locale_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: Astanovka(),
    ),
  );
}

class Astanovka extends ConsumerWidget {
  const Astanovka({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the router and locale providers
    final router = ref.watch(routerProvider);
    final locale = ref.watch(localeProvider);

    return MaterialApp.router(
      title: 'Astanovka',
      debugShowCheckedModeBanner: false,
      locale: locale,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          primary: Colors.green,
          surface: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          elevation: 0,
        ),
        useMaterial3: true,
      ),
      routerConfig: router, // <-- Uses the updated routerProvider with PlaceInfoScreen
    );
  }
}
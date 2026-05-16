import 'package:google_fonts/google_fonts.dart';

void main() {
  final keys = GoogleFonts.asMap().keys.toList();
  for (var key in keys) {
    if (key.toLowerCase().contains('badeen')) {
      print('FOUND BADEEN: \$key');
    }
    if (key.toLowerCase().contains('display')) {
      // print('FOUND DISPLAY: \$key');
    }
  }
}

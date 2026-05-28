import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'paleta_colores.dart';

class AppTheme {
  final bool tenebrisModusEst;

  AppTheme({this.tenebrisModusEst = false});

  ThemeData getTheme() {
    final scheme = tenebrisModusEst ? darkPalette : lightPalette;

    return ThemeData(
      colorScheme: scheme,
      brightness: scheme.brightness,
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
      ),
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        titleLarge: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        bodyMedium: GoogleFonts.inter(),
      ),
    );
  }
}

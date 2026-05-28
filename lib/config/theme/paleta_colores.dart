import 'package:flutter/material.dart';

final ColorScheme lightPalette = const ColorScheme(
  brightness: Brightness.light,

  primary: Color(0xFFC34B61),
  onPrimary: Colors.white,
  primaryContainer: Color(0xFFEB84A5),
  onPrimaryContainer: Colors.white,

  secondary: Color(0xFFEBC6D4),
  onSecondary: Color(0xFF3A1F25),
  secondaryContainer: Color(0xFFF3C9D0),
  onSecondaryContainer: Color(0xFF3A1F25),

  tertiary: Color(0xFFF1BBCA),
  onTertiary: Color(0xFF3A1F25),
  tertiaryContainer: Color(0xFFF3C9D0),
  onTertiaryContainer: Color(0xFF3A1F25),

  error: Color(0xFFBA1A1A),
  onError: Colors.white,
  errorContainer: Color(0xFFFFDAD6),
  onErrorContainer: Color(0xFF410002),

  surface: Color(0xFFFFF7F9),
  onSurface: Color(0xFF2B1A1F),

  surfaceDim: Color(0xFFF3E7EA),
  surfaceBright: Color(0xFFFFF7F9),
  surfaceContainerLowest: Color(0xFFFFFFFF),
  surfaceContainerLow: Color(0xFFF3C9D0),
  surfaceContainer: Color(0xFFEBC6D4),
  surfaceContainerHigh: Color(0xFFE5B8C4),
  surfaceContainerHighest: Color(0xFFDDAAB8),

  outline: Color(0xFFC34B61),
  outlineVariant: Color(0xFFEBC6D4),

  shadow: Color(0xFF000000),
  scrim: Color(0xFF000000),

  inverseSurface: Color(0xFF2B1A1F),
  onInverseSurface: Color(0xFFFFF7F9),
  inversePrimary: Color(0xFFEB84A5),
);

final ColorScheme darkPalette = const ColorScheme(
  brightness: Brightness.dark,

  primary: Color(0xFFEB84A5),
  onPrimary: Color(0xFF3A1F25),
  primaryContainer: Color(0xFFC34B61),
  onPrimaryContainer: Colors.white,

  secondary: Color(0xFFF3C9D0),
  onSecondary: Color(0xFF3A1F25),
  secondaryContainer: Color(0xFFEBC6D4),
  onSecondaryContainer: Color(0xFF3A1F25),

  tertiary: Color(0xFFF1BBCA),
  onTertiary: Color(0xFF3A1F25),
  tertiaryContainer: Color(0xFFEBC6D4),
  onTertiaryContainer: Color(0xFF3A1F25),

  error: Color(0xFFFFB4AB),
  onError: Color(0xFF690005),
  errorContainer: Color(0xFF93000A),
  onErrorContainer: Color(0xFFFFDAD6),

  surface: Color(0xFF1A1214),
  onSurface: Color(0xFFF3E7EA),

  surfaceDim: Color(0xFF140D0F),
  surfaceBright: Color(0xFF3A2A2F),
  surfaceContainerLowest: Color(0xFF0F090A),
  surfaceContainerLow: Color(0xFF2B1A1F),
  surfaceContainer: Color(0xFF3A1F25),
  surfaceContainerHigh: Color(0xFF4A2A32),
  surfaceContainerHighest: Color(0xFF5A343C),

  outline: Color(0xFFEB84A5),
  outlineVariant: Color(0xFF3A1F25),

  shadow: Color(0xFF000000),
  scrim: Color(0xFF000000),

  inverseSurface: Color(0xFFF3E7EA),
  onInverseSurface: Color(0xFF2B1A1F),
  inversePrimary: Color(0xFFC34B61),
);

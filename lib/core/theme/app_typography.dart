import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Centralised typography built on top of Google Fonts (Poppins).
///
/// Returns a [TextTheme] that is colour-agnostic; colours are applied by
/// [ThemeData] using the active [ColorScheme] so the same scale works for both
/// light and dark themes.
abstract final class AppTypography {
  const AppTypography._();

  /// Builds the app [TextTheme] for the given [brightness].
  static TextTheme textTheme(Brightness brightness) {
    final Color base = brightness == Brightness.light
        ? const Color(0xFF1A1330)
        : const Color(0xFFF3F2FB);

    final TextTheme poppins = GoogleFonts.poppinsTextTheme();

    return poppins
        .copyWith(
          displayLarge: poppins.displayLarge?.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: -0.5,
          ),
          displayMedium: poppins.displayMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
          headlineLarge: poppins.headlineLarge?.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 32,
          ),
          headlineMedium: poppins.headlineMedium?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 26,
          ),
          headlineSmall: poppins.headlineSmall?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
          titleLarge: poppins.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
          titleMedium: poppins.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          titleSmall: poppins.titleSmall?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
          bodyLarge: poppins.bodyLarge?.copyWith(fontSize: 15),
          bodyMedium: poppins.bodyMedium?.copyWith(fontSize: 14),
          bodySmall: poppins.bodySmall?.copyWith(fontSize: 12),
          labelLarge: poppins.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
          labelMedium: poppins.labelMedium?.copyWith(fontSize: 12),
          labelSmall: poppins.labelSmall?.copyWith(
            fontSize: 11,
            letterSpacing: 0.6,
          ),
        )
        .apply(bodyColor: base, displayColor: base);
  }
}

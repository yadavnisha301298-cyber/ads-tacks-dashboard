import 'package:flutter/material.dart';

/// The single source of truth for every colour used in the application.
///
/// Widgets must never hardcode a [Color]; they either read from the active
/// [ThemeData]/[ColorScheme] or from the [DashboardColors] theme extension.
/// This class only defines the raw palette + the two [ColorScheme]s.
abstract final class AppColors {
  const AppColors._();

  // ---- Brand ----------------------------------------------------------------
  static const Color primary = Color(0xFF7B61FF); // Adstacks purple
  static const Color primaryDark = Color(0xFF5B3FD6);
  static const Color primaryLight = Color(0xFFB89DFF);
  static const Color accentPink = Color(0xFFEB5A7C);
  static const Color accentRed = Color(0xFFE8506B);

  // ---- Neutrals -------------------------------------------------------------
  static const Color ink = Color(0xFF1A1330); // near-black text
  static const Color inkMuted = Color(0xFF6B6B80);
  static const Color white = Color(0xFFFFFFFF);
  static const Color canvasLight = Color(0xFFF4F5F9);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color dividerLight = Color(0xFFE9E9F0);

  // ---- Dark panels (used on both themes for the navy cards) -----------------
  static const Color navy = Color(0xFF14133B);
  static const Color navySurface = Color(0xFF1D1B4B);
  static const Color navyElevated = Color(0xFF262357);

  // ---- Dark theme neutrals --------------------------------------------------
  static const Color canvasDark = Color(0xFF0E0D2B);
  static const Color surfaceDark = Color(0xFF17163D);
  static const Color dividerDark = Color(0xFF2C2A5A);
  static const Color inkInverse = Color(0xFFF3F2FB);

  // ---- Data-viz / status ----------------------------------------------------
  static const Color chartPending = Color(0xFFEB8FA0);
  static const Color chartDone = Color(0xFF4B39C7);
  static const Color success = Color(0xFF34C77B);
  static const Color warning = Color(0xFFF5A623);
  static const Color danger = Color(0xFFE8506B);

  // ---- Gradients ------------------------------------------------------------
  static const List<Color> heroGradient = <Color>[
    Color(0xFFEB6F92),
    Color(0xFF9B4DCA),
    Color(0xFF5B3FD6),
  ];

  static const List<Color> purpleButtonGradient = <Color>[
    Color(0xFF9F7BFF),
    Color(0xFF7B61FF),
  ];

  /// Light [ColorScheme] derived from the brand palette.
  static const ColorScheme light = ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    onPrimary: white,
    primaryContainer: primaryLight,
    onPrimaryContainer: ink,
    secondary: accentPink,
    onSecondary: white,
    secondaryContainer: Color(0xFFFCE1E8),
    onSecondaryContainer: ink,
    tertiary: chartDone,
    onTertiary: white,
    error: danger,
    onError: white,
    surface: surfaceLight,
    onSurface: ink,
    surfaceContainerHighest: canvasLight,
    onSurfaceVariant: inkMuted,
    outline: dividerLight,
    outlineVariant: dividerLight,
    shadow: Color(0x1A1A1330),
    scrim: Color(0x66000000),
    inverseSurface: navy,
    onInverseSurface: inkInverse,
    inversePrimary: primaryLight,
  );

  /// Dark [ColorScheme] derived from the brand palette.
  static const ColorScheme dark = ColorScheme(
    brightness: Brightness.dark,
    primary: primaryLight,
    onPrimary: navy,
    primaryContainer: primaryDark,
    onPrimaryContainer: inkInverse,
    secondary: accentPink,
    onSecondary: white,
    secondaryContainer: Color(0xFF4A2333),
    onSecondaryContainer: inkInverse,
    tertiary: primaryLight,
    onTertiary: navy,
    error: danger,
    onError: white,
    surface: surfaceDark,
    onSurface: inkInverse,
    surfaceContainerHighest: navyElevated,
    onSurfaceVariant: Color(0xFFB6B4D6),
    outline: dividerDark,
    outlineVariant: dividerDark,
    shadow: Color(0x66000000),
    scrim: Color(0x99000000),
    inverseSurface: canvasLight,
    onInverseSurface: ink,
    inversePrimary: primary,
  );
}

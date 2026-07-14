import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import 'app_colors.dart';
import 'app_typography.dart';
import 'dashboard_theme_extension.dart';

/// Assembles the light and dark [ThemeData] for the application.
///
/// All component themes derive their colours from the [ColorScheme] and the
/// [DashboardColors] extension, ensuring nothing is hardcoded at the call site.
abstract final class AppTheme {
  const AppTheme._();

  static ThemeData light() => _build(AppColors.light, DashboardColors.lightTokens);
  static ThemeData dark() => _build(AppColors.dark, DashboardColors.darkTokens);

  static ThemeData _build(ColorScheme scheme, DashboardColors dashboard) {
    final TextTheme textTheme = AppTypography.textTheme(scheme.brightness);

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: dashboard.canvas,
      textTheme: textTheme,
      fontFamily: textTheme.bodyMedium?.fontFamily,
      splashFactory: InkSparkle.splashFactory,
      extensions: <ThemeExtension<dynamic>>[dashboard],
      cardTheme: CardThemeData(
        color: scheme.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.brLg),
      ),
      dividerTheme: DividerThemeData(
        color: scheme.outlineVariant,
        thickness: 1,
        space: 1,
      ),
      iconTheme: IconThemeData(color: scheme.onSurfaceVariant),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          textStyle: textTheme.labelLarge,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.brMd),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: scheme.primary),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.brightness == Brightness.light
            ? AppColors.navy
            : AppColors.navyElevated,
        hintStyle: textTheme.bodyMedium?.copyWith(color: dashboard.panelTextMuted),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        border: const OutlineInputBorder(
          borderRadius: AppRadius.brMd,
          borderSide: BorderSide.none,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: AppRadius.brMd,
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.brMd,
          borderSide: BorderSide(color: scheme.primary, width: 1.5),
        ),
      ),
      navigationDrawerTheme: NavigationDrawerThemeData(
        backgroundColor: scheme.surface,
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: dashboard.panel,
          borderRadius: AppRadius.brSm,
        ),
        textStyle: textTheme.bodySmall?.copyWith(color: dashboard.panelText),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'app_colors.dart';

/// A [ThemeExtension] that carries the bespoke dashboard tokens which do not
/// fit neatly into Material's [ColorScheme] — gradients, the always-dark navy
/// panels, chart colours and elevation shadows.
///
/// Access it anywhere with `Theme.of(context).extension<DashboardColors>()!`
/// or the `context.dashboard` extension getter.
@immutable
class DashboardColors extends ThemeExtension<DashboardColors> {
  const DashboardColors({
    required this.canvas,
    required this.panel,
    required this.panelElevated,
    required this.panelText,
    required this.panelTextMuted,
    required this.heroGradient,
    required this.purpleButtonGradient,
    required this.chartPending,
    required this.chartDone,
    required this.cardShadow,
    required this.activeNavBackground,
  });

  /// The page background behind all cards.
  final Color canvas;

  /// The navy sidebar/right-panel/card colour (dark in both themes).
  final Color panel;
  final Color panelElevated;
  final Color panelText;
  final Color panelTextMuted;

  final List<Color> heroGradient;
  final List<Color> purpleButtonGradient;

  final Color chartPending;
  final Color chartDone;

  final List<BoxShadow> cardShadow;
  final Color activeNavBackground;

  static const DashboardColors lightTokens = DashboardColors(
    canvas: AppColors.canvasLight,
    panel: AppColors.navy,
    panelElevated: AppColors.navyElevated,
    panelText: AppColors.inkInverse,
    panelTextMuted: Color(0xFF9E9CC4),
    heroGradient: AppColors.heroGradient,
    purpleButtonGradient: AppColors.purpleButtonGradient,
    chartPending: AppColors.chartPending,
    chartDone: AppColors.chartDone,
    cardShadow: <BoxShadow>[
      BoxShadow(
        color: Color(0x14161033),
        blurRadius: 24,
        offset: Offset(0, 8),
      ),
    ],
    activeNavBackground: Color(0xFFEDEBFF),
  );

  static const DashboardColors darkTokens = DashboardColors(
    canvas: AppColors.canvasDark,
    panel: AppColors.navySurface,
    panelElevated: AppColors.navyElevated,
    panelText: AppColors.inkInverse,
    panelTextMuted: Color(0xFF9E9CC4),
    heroGradient: AppColors.heroGradient,
    purpleButtonGradient: AppColors.purpleButtonGradient,
    chartPending: AppColors.chartPending,
    chartDone: AppColors.chartDone,
    cardShadow: <BoxShadow>[
      BoxShadow(
        color: Color(0x40000000),
        blurRadius: 24,
        offset: Offset(0, 8),
      ),
    ],
    activeNavBackground: Color(0xFF262357),
  );

  @override
  DashboardColors copyWith({
    Color? canvas,
    Color? panel,
    Color? panelElevated,
    Color? panelText,
    Color? panelTextMuted,
    List<Color>? heroGradient,
    List<Color>? purpleButtonGradient,
    Color? chartPending,
    Color? chartDone,
    List<BoxShadow>? cardShadow,
    Color? activeNavBackground,
  }) {
    return DashboardColors(
      canvas: canvas ?? this.canvas,
      panel: panel ?? this.panel,
      panelElevated: panelElevated ?? this.panelElevated,
      panelText: panelText ?? this.panelText,
      panelTextMuted: panelTextMuted ?? this.panelTextMuted,
      heroGradient: heroGradient ?? this.heroGradient,
      purpleButtonGradient: purpleButtonGradient ?? this.purpleButtonGradient,
      chartPending: chartPending ?? this.chartPending,
      chartDone: chartDone ?? this.chartDone,
      cardShadow: cardShadow ?? this.cardShadow,
      activeNavBackground: activeNavBackground ?? this.activeNavBackground,
    );
  }

  @override
  DashboardColors lerp(ThemeExtension<DashboardColors>? other, double t) {
    if (other is! DashboardColors) return this;
    return DashboardColors(
      canvas: Color.lerp(canvas, other.canvas, t)!,
      panel: Color.lerp(panel, other.panel, t)!,
      panelElevated: Color.lerp(panelElevated, other.panelElevated, t)!,
      panelText: Color.lerp(panelText, other.panelText, t)!,
      panelTextMuted: Color.lerp(panelTextMuted, other.panelTextMuted, t)!,
      heroGradient: _lerpColors(heroGradient, other.heroGradient, t),
      purpleButtonGradient:
          _lerpColors(purpleButtonGradient, other.purpleButtonGradient, t),
      chartPending: Color.lerp(chartPending, other.chartPending, t)!,
      chartDone: Color.lerp(chartDone, other.chartDone, t)!,
      cardShadow: t < 0.5 ? cardShadow : other.cardShadow,
      activeNavBackground:
          Color.lerp(activeNavBackground, other.activeNavBackground, t)!,
    );
  }

  static List<Color> _lerpColors(List<Color> a, List<Color> b, double t) {
    final int length = a.length < b.length ? a.length : b.length;
    return List<Color>.generate(
      length,
      (int i) => Color.lerp(a[i], b[i], t)!,
    );
  }
}

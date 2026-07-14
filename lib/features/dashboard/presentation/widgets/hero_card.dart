import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/widgets/dashboard_card.dart';
import '../../domain/entities/hero_project.dart';

/// The large gradient promo card ("Top Rating Project") with floating abstract
/// 3D-style shapes and a call-to-action, fading in on first build.
class HeroCard extends StatelessWidget {
  const HeroCard({super.key, required this.hero, this.onCtaPressed});

  final HeroProject hero;
  final VoidCallback? onCtaPressed;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: AppDurations.slow,
      curve: Curves.easeOut,
      tween: Tween<double>(begin: 0, end: 1),
      builder: (BuildContext context, double t, Widget? child) =>
          Opacity(opacity: t, child: child),
      child: DashboardCard(
        padding: EdgeInsets.zero,
        gradient: LinearGradient(
          colors: context.dashboard.heroGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        child: Stack(
          children: <Widget>[
            const Positioned.fill(child: _FloatingShapes()),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: _HeroContent(hero: hero, onCtaPressed: onCtaPressed),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroContent extends StatelessWidget {
  const _HeroContent({required this.hero, this.onCtaPressed});

  final HeroProject hero;
  final VoidCallback? onCtaPressed;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 420),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            hero.tag,
            style: context.text.labelSmall?.copyWith(
              color: Colors.white70,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            hero.title,
            style: context.text.headlineLarge?.copyWith(
              color: Colors.white,
              height: 1.1,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            hero.description,
            style: context.text.bodyMedium?.copyWith(color: Colors.white70),
          ),
          const SizedBox(height: AppSpacing.lg),
          FilledButton(
            onPressed: onCtaPressed,
            style: FilledButton.styleFrom(
              backgroundColor: context.dashboard.panel,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.md,
              ),
            ),
            child: Text(hero.ctaLabel),
          ),
        ],
      ),
    );
  }
}

/// Decorative floating shapes painted on the right side of the hero card.
///
/// Purely aesthetic; excluded from the semantics tree.
class _FloatingShapes extends StatelessWidget {
  const _FloatingShapes();

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints c) {
          final double w = c.maxWidth;
          return Stack(
            children: <Widget>[
              Positioned(
                right: w * 0.20,
                top: 24,
                child: _torus(70, const Color(0xFF1B1636)),
              ),
              Positioned(
                right: w * 0.04,
                top: 70,
                child: _diamond(120, const Color(0xFF8E44D6)),
              ),
              Positioned(
                right: w * 0.28,
                bottom: 24,
                child: _capsule(const Color(0xFF5B8DEF)),
              ),
              Positioned(
                right: w * 0.02,
                bottom: 8,
                child: _diamond(48, Colors.white24),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _torus(double size, Color color) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: color, width: size * 0.28),
        ),
      );

  Widget _diamond(double size, Color color) => Transform.rotate(
        angle: 0.785398, // 45°
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(size * 0.18),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: color.withValues(alpha: 0.4),
                blurRadius: 24,
                offset: const Offset(0, 12),
              ),
            ],
          ),
        ),
      );

  Widget _capsule(Color color) => Transform.rotate(
        angle: -0.6,
        child: Container(
          width: 70,
          height: 30,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(AppRadius.pill),
          ),
        ),
      );
}

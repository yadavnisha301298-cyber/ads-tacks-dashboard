import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'core/constants/app_constants.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_controller.dart';

/// Root application widget.
///
/// Provides the router, both themes (driven by [themeControllerProvider]) and a
/// [ResponsiveBreakpoints] wrapper so descendant widgets can rely on consistent
/// breakpoint semantics across mobile, tablet, desktop and web.
class OfficeDashboardApp extends ConsumerStatefulWidget {
  const OfficeDashboardApp({super.key});

  @override
  ConsumerState<OfficeDashboardApp> createState() => _OfficeDashboardAppState();
}

class _OfficeDashboardAppState extends ConsumerState<OfficeDashboardApp> {
  late final GoRouter _router = AppRouter.create();

  @override
  Widget build(BuildContext context) {
    final ThemeMode themeMode = ref.watch(themeControllerProvider);

    return MaterialApp.router(
      title: 'Adstacks Office Dashboard',
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: themeMode,
      builder: (BuildContext context, Widget? child) {
        return ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: const <Breakpoint>[
            Breakpoint(start: 0, end: AppBreakpoints.mobile, name: MOBILE),
            Breakpoint(
              start: AppBreakpoints.mobile + 1,
              end: AppBreakpoints.tablet,
              name: TABLET,
            ),
            Breakpoint(
              start: AppBreakpoints.tablet + 1,
              end: double.infinity,
              name: DESKTOP,
            ),
          ],
        );
      },
    );
  }
}

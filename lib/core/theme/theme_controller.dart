import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Holds the currently selected [ThemeMode] and exposes actions to change it.
///
/// This is intentionally a tiny [StateNotifier] — theme selection is UI state,
/// not business logic, so it lives in the presentation-adjacent core layer.
class ThemeController extends StateNotifier<ThemeMode> {
  ThemeController() : super(ThemeMode.light);

  /// Toggles between light and dark, treating "system" as light.
  void toggle() {
    state = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
  }

  void setMode(ThemeMode mode) => state = mode;
}

/// Global provider for the active [ThemeMode].
final StateNotifierProvider<ThemeController, ThemeMode> themeControllerProvider =
    StateNotifierProvider<ThemeController, ThemeMode>(
  (Ref ref) => ThemeController(),
);

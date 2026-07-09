import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

/// Application entry point.
///
/// Wraps the app in a Riverpod [ProviderScope] so the entire dependency graph
/// (data sources → repositories → use cases → UI providers) is available.
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: OfficeDashboardApp()));
}

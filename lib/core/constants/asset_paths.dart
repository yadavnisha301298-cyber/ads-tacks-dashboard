/// Type-safe references to bundled asset files.
///
/// Keeping asset paths in one place avoids stringly-typed lookups scattered
/// across the codebase and makes renames a single-line change.
abstract final class AssetPaths {
  const AssetPaths._();

  static const String _data = 'assets/data';

  /// Bundled mock JSON that emulates a remote API response.
  static const String dashboardJson = '$_data/dashboard.json';
}

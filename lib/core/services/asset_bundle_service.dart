import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../errors/exceptions.dart';

/// Abstraction over the Flutter asset bundle so data sources can be unit-tested
/// with a fake implementation instead of the real `rootBundle`.
abstract interface class AssetBundleService {
  /// Loads [path] from the bundle and decodes it as JSON.
  Future<Map<String, dynamic>> loadJson(String path);
}

/// Default implementation backed by [rootBundle].
class RootBundleService implements AssetBundleService {
  const RootBundleService();

  @override
  Future<Map<String, dynamic>> loadJson(String path) async {
    try {
      final String raw = await rootBundle.loadString(path);
      final Object? decoded = jsonDecode(raw);
      if (decoded is! Map<String, dynamic>) {
        throw const ParseException('Root JSON node is not an object.');
      }
      return decoded;
    } on ParseException {
      rethrow;
    } on FormatException catch (e) {
      throw ParseException(e.message);
    } catch (e) {
      throw CacheException('Could not load asset "$path": $e');
    }
  }
}

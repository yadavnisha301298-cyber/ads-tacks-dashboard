import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../network/dio_client.dart';
import '../services/asset_bundle_service.dart';

/// Application-wide dependency graph, expressed as Riverpod providers.
///
/// Feature providers compose these infrastructure providers, giving us
/// constructor-based dependency injection without a service-locator singleton.

/// Provides the asset bundle service used by local data sources.
final Provider<AssetBundleService> assetBundleServiceProvider =
    Provider<AssetBundleService>((Ref ref) => const RootBundleService());

/// Provides a configured [DioClient] for any future remote data sources.
final Provider<DioClient> dioClientProvider =
    Provider<DioClient>((Ref ref) => DioClient());

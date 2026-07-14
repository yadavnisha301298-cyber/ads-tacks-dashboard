import '../../../../core/constants/asset_paths.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/services/asset_bundle_service.dart';
import '../models/dashboard_models.dart';

/// Reads the dashboard payload from a bundled JSON asset.
///
/// This emulates a remote API: swapping to a live backend only requires a
/// `DashboardRemoteDataSource` with the same interface — nothing else changes.
abstract interface class DashboardLocalDataSource {
  Future<DashboardResponseModel> fetchDashboard();
}

class DashboardLocalDataSourceImpl implements DashboardLocalDataSource {
  const DashboardLocalDataSourceImpl(this._bundle);

  final AssetBundleService _bundle;

  @override
  Future<DashboardResponseModel> fetchDashboard() async {
    final Map<String, dynamic> json =
        await _bundle.loadJson(AssetPaths.dashboardJson);
    try {
      return DashboardResponseModel.fromJson(json);
    } catch (e) {
      throw ParseException('Malformed dashboard payload: $e');
    }
  }
}

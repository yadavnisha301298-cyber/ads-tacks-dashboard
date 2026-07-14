import 'package:dio/dio.dart';

/// Thin wrapper around [Dio] with sensible defaults.
///
/// The dashboard currently reads bundled mock JSON, but a configured HTTP
/// client is provided so swapping to a live REST backend is a one-line change
/// in the data source — the rest of the architecture is unaffected.
class DioClient {
  DioClient({String baseUrl = 'https://api.adstacks.example'})
      : dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: const Duration(seconds: 15),
            receiveTimeout: const Duration(seconds: 15),
            headers: <String, String>{'Accept': 'application/json'},
          ),
        );

  final Dio dio;
}

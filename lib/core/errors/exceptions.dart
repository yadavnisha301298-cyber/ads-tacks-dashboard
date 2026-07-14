/// Low-level exceptions thrown by the data layer.
///
/// These are caught by repositories and mapped to [Failure]s so the domain and
/// presentation layers never depend on data-source implementation details.
library;

/// Thrown when a bundled asset or remote resource cannot be read.
class CacheException implements Exception {
  const CacheException([this.message = 'Failed to read local data.']);
  final String message;

  @override
  String toString() => 'CacheException: $message';
}

/// Thrown when parsing a payload into a model fails.
class ParseException implements Exception {
  const ParseException([this.message = 'Failed to parse data.']);
  final String message;

  @override
  String toString() => 'ParseException: $message';
}

/// Thrown for network/transport level errors.
class ServerException implements Exception {
  const ServerException([this.message = 'Server error.']);
  final String message;

  @override
  String toString() => 'ServerException: $message';
}

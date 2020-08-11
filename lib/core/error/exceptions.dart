/// This handles exceptions from network calls
class ServerException implements Exception {
  String message;
  ServerException({
    this.message,
  });
}

/// This handles exceptions from database calls
class CacheException implements Exception {
  String message;
  CacheException({
    this.message,
  });
}

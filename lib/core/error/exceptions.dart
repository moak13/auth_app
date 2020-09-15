import 'dart:convert';

/// This handles exceptions from network calls
class ServerException implements Exception {
  String message;
  ServerException({
    this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'message': message,
    };
  }

  factory ServerException.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ServerException(
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ServerException.fromJson(String source) =>
      ServerException.fromMap(json.decode(source));
}

/// This handles exceptions from database calls
class CacheException implements Exception {
  String message;
  CacheException({
    this.message,
  });
}

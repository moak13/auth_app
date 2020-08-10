class Result<T> {
  final T success;
  final Error error;
  Result({
    this.success,
    this.error,
  });
}

class Success<T> extends Result {
  final T data;
  Success({
    this.data,
  });
}

class Error extends Result {
  final String message;
  Error({
    this.message,
  });

  @override
  String toString() {
    return message;
  }
}

/// Handles all server error messages
class ServerError extends Error {
  ServerError(String message) : super(message: message);
}

/// Handles all cache error messages
class CacheError extends Error {
  CacheError(String message) : super(message: message);
}

/// Handles no internet connection
class NoInternetError extends Error {
  NoInternetError(String message) : super(message: message);
}

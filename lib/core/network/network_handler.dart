import 'package:http/http.dart' as http;

import '../../locator.dart';

/// This helps to handle internet request within the application.
abstract class NetworkHandler {
  /// This handles the post request.
  Future<http.Response> handlePost(
      {String url, Map<String, dynamic> body, Map<String, String> headers});

  /// This handles the get request.
  Future<http.Response> handleGet({String url, Map<String, String> headers});
}

/// This is an implementation of the [NetworkHandler] abstract class
class NetworkHandlerImpl implements NetworkHandler {
  final client = locator<http.Client>();
  @override
  Future<http.Response> handleGet({String url, Map<String, String> headers}) {
    final response = client.get(url, headers: headers);
    return response;
  }

  @override
  Future<http.Response> handlePost(
      {String url, Map<String, dynamic> body, Map<String, String> headers}) {
    final response = client.post(url, body: body, headers: headers);
    return response;
  }
}

class SignupResponse {
  String message;

  SignupResponse({this.message});

  String get msg => message;

  SignupResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}

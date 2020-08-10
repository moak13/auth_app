import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'login_model.dart';
import 'signup_model.dart';

class MergedModel extends Equatable {
  final SignupModel signupModel;
  final LoginModel loginModel;
  MergedModel({
    this.signupModel,
    this.loginModel,
  });

  @override
  List<Object> get props => [signupModel, loginModel];

  LoginModel toLogin() {
    return loginModel;
  }

  SignupModel toSignup() {
    return signupModel;
  }

  Map<String, dynamic> toMap() {
    return {
      'signupModel': signupModel?.toMap(),
      'loginModel': loginModel?.toMap(),
    };
  }

  factory MergedModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MergedModel(
      signupModel: SignupModel.fromMap(map['signupModel']),
      loginModel: LoginModel.fromMap(map['loginModel']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MergedModel.fromJson(String source) =>
      MergedModel.fromMap(json.decode(source));
}

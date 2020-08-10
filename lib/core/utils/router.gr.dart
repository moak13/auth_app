// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/home/view/home_view.dart';
import '../../features/login/view/login_view.dart';
import '../../features/signup/view/signup_view.dart';
import '../../features/splash/view/splash_view.dart';
import '../../features/welcome/view/welcome_view.dart';

class Routes {
  static const String splashView = '/';
  static const String welcomeView = '/welcome-view';
  static const String loginView = '/login-view';
  static const String signupView = '/signup-view';
  static const String homeView = '/home-view';
  static const all = <String>{
    splashView,
    welcomeView,
    loginView,
    signupView,
    homeView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashView, page: SplashView),
    RouteDef(Routes.welcomeView, page: WelcomeView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.signupView, page: SignupView),
    RouteDef(Routes.homeView, page: HomeView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const SplashView(),
        settings: data,
      );
    },
    WelcomeView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const WelcomeView(),
        settings: data,
      );
    },
    LoginView: (data) {
      final args = data.getArgs<LoginViewArguments>(
        orElse: () => LoginViewArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => LoginView(key: args.key),
        settings: data,
      );
    },
    SignupView: (data) {
      final args = data.getArgs<SignupViewArguments>(
        orElse: () => SignupViewArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => SignupView(key: args.key),
        settings: data,
      );
    },
    HomeView: (data) {
      final args = data.getArgs<HomeViewArguments>(
        orElse: () => HomeViewArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => HomeView(key: args.key),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// LoginView arguments holder class
class LoginViewArguments {
  final Key key;
  LoginViewArguments({this.key});
}

/// SignupView arguments holder class
class SignupViewArguments {
  final Key key;
  SignupViewArguments({this.key});
}

/// HomeView arguments holder class
class HomeViewArguments {
  final Key key;
  HomeViewArguments({this.key});
}

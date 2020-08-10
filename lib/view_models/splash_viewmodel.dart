import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../data_source/local/data_local_data_source.dart';
import '../locator.dart';

class SplashViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final pref = locator<DataLocalDataSource>();

  _nextPage() async {
    print('jumping in');
    final data = await pref.getResponse();
    print('checking...');
    print(data.loginModel.id);
    print(data.signupModel.id);
    if (data.loginModel.id == null && data.signupModel.id == null) {
      print('data is null');
      return navigationService.navigateTo('/welcome-view');
    } else {
      print('data not null');
      return navigationService.navigateTo('home-view');
    }
  }

  handleMove() async {
    print('moving action taking place');
    Duration duration = Duration(seconds: 5);
    return Timer(duration, _nextPage);
  }
}

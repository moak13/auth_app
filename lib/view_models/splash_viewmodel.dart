import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../data_source/local/data_local_data_source.dart';
import '../locator.dart';

class SplashViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final pref = locator<DataLocalDataSource>();

  _nextPage() async {
    final data = await pref.getResponse();
    if (data.id == 0) {
      return navigationService.pushNamedAndRemoveUntil('/welcome-view');
    } else {
      return navigationService.pushNamedAndRemoveUntil('/home-view');
    }
  }

  handleMove() async {
    Duration duration = Duration(seconds: 5);
    return Timer(duration, _nextPage);
  }
}

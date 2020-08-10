import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../view_models/splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
        onModelReady: (model) => model.handleMove(),
        builder: (context, model, child) {
          return Scaffold(
            body: Container(
              child: Center(
                child: Text('Splash Screen'),
              ),
            ),
          );
        },
        viewModelBuilder: () => SplashViewModel());
  }
}

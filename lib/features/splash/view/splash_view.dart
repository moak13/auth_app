import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../view_models/splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double scaleHeight = height / 100;
    double width = MediaQuery.of(context).size.width;
    double scaleWidth = width / 100;
    double sizeText = MediaQuery.of(context).textScaleFactor;
    return ViewModelBuilder<SplashViewModel>.reactive(
        onModelReady: (model) => model.handleMove(),
        builder: (context, model, child) {
          return Scaffold(
            body: Container(
              height: height,
              width: width,
              color: Theme.of(context).primaryColor.withOpacity(0.5),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Auth',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: sizeText * 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: scaleWidth * 3,
                  ),
                  Container(
                    height: scaleHeight * 20,
                    width: scaleWidth * 20,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        'App',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: sizeText * 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              )),
            ),
          );
        },
        viewModelBuilder: () => SplashViewModel());
  }
}

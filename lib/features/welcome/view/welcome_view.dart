import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../view_models/welcome_viewmodel.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double scaleHeight = height / 100;
    double width = MediaQuery.of(context).size.width;
    double scaleWidth = width / 100;
    double sizeText = MediaQuery.of(context).textScaleFactor;
    return ViewModelBuilder<WelcomeViewModel>.reactive(
        builder: (context, model, child) {
          return Scaffold(
            body: SafeArea(
              child: Container(
                height: height,
                width: width,
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Welcome',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: sizeText * 30,
                        ),
                      ),
                      SizedBox(
                        height: scaleHeight * 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              model.moveToLogin();
                            },
                            child: Container(
                              height: scaleHeight * 7,
                              width: scaleWidth * 30,
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  'login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: sizeText * 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              model.moveToSignup();
                            },
                            child: Container(
                              height: scaleHeight * 7,
                              width: scaleWidth * 30,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  'signup',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: sizeText * 16,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        viewModelBuilder: () => WelcomeViewModel());
  }
}

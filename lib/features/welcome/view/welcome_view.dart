import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../view_models/welcome_viewmodel.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WelcomeViewModel>.reactive(
        builder: (context, model, child) {
          ScreenUtil.init(
            context,
            height: ScreenUtil.screenHeight,
            width: ScreenUtil.screenWidth,
            allowFontScaling: true,
          );
          return Scaffold(
            body: Container(
              // height: ScreenUtil().setHeight(ScreenUtil.screenHeight),
              // width: ScreenUtil().setWidth(ScreenUtil.screenWidth),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Welcome'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            onPressed: () {
                              model.moveToLogin();
                            },
                            child: Text('Login'),
                          ),
                        ),
                        Expanded(
                          child: RaisedButton(
                            onPressed: () {
                              model.moveToSignup();
                            },
                            child: Text('Signup'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        viewModelBuilder: () => WelcomeViewModel());
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../view_models/splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      height: ScreenUtil.screenHeight,
      width: ScreenUtil.screenWidth,
      allowFontScaling: true,
    );
    return ViewModelBuilder<SplashViewModel>.reactive(
        onModelReady: (model) => model.handleMove(),
        builder: (context, model, child) {
          return Scaffold(
            body: Container(
              height: ScreenUtil.screenHeight,
              width: ScreenUtil.screenWidth,
              color: Theme.of(context).primaryColor.withOpacity(0.5),
              child: Center(
                  child: Row(
                children: <Widget>[
                  Text(
                    'Auth',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(12),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(30),
                  ),
                  Container(
                    height: ScreenUtil().setHeight(20),
                    width: ScreenUtil().setWidth(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        'App',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: ScreenUtil().setSp(12),
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

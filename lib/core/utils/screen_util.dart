import 'package:flutter/material.dart';

class ScreenUtil {
  double _screenHeight;
  double get screenHeight => _screenHeight;

  num _uiPixelHeight;
  num _uiPixelWidth;

  double _screenWidth;
  double get screenWidth => _screenWidth;

  double _textScale;
  double get textScale => _textScale;

  void init(BuildContext context, {double deviceHeight, double deviceWidth}) {
    _uiPixelHeight = deviceHeight;
    _uiPixelWidth = deviceWidth;
    _screenHeight = MediaQuery.of(context).size.height;
    _screenWidth = MediaQuery.of(context).size.width;
    _textScale = MediaQuery.of(context).textScaleFactor;
  }

  // num setHeight(double height) =>
}

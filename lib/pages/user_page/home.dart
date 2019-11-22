import 'package:auth_app/pages/auth_page/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance = ScreenUtil(
        allowFontScaling: true,
        height: ScreenUtil.screenHeight,
        width: ScreenUtil.screenWidth)
      ..init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(40),
              child: Placeholder(
                color: Colors.amber,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: CircleAvatar(
                    radius: 50,
                    child: Icon(Icons.person),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 30, top: 30, bottom: 5),
                        child: Text('name'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 30, bottom: 30, top: 5),
                        child: Text('email'),
                      )
                    ],
                  ),
                )
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Ink(
                height: ScreenUtil().setHeight(50),
                width: ScreenUtil().setWidth(100),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text('log out'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

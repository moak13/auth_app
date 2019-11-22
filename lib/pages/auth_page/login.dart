import 'package:auth_app/pages/auth_page/signup.dart';
import 'package:auth_app/pages/user_page/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController ctrlEmail = new TextEditingController();
  TextEditingController ctrlPass = new TextEditingController();

  bool _obscuredText = true;

  void toggle() {
    setState(() {
      _obscuredText = !_obscuredText;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance = ScreenUtil(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        allowFontScaling: true)
      ..init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Placeholder(
                  color: Colors.amber,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.center,
                child: Form(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(25),
                        child: TextFormField(
                          controller: ctrlEmail,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: 'enter your email',
                              border: OutlineInputBorder()),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25),
                        child: TextFormField(
                          controller: ctrlPass,
                          obscureText: _obscuredText,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'enter your password',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  toggle();
                                },
                                icon: Icon(_obscuredText
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                              border: OutlineInputBorder()),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomePage()));
                        },
                        child: Ink(
                          padding: const EdgeInsets.all(25),
                          height: ScreenUtil().setHeight(80),
                          width: ScreenUtil().setWidth(400),
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Text(
                            'login',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignupPage()));
                  },
                  child: Center(child: Text('create an account!')),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

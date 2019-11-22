import 'package:flutter/material.dart';

class LoginSamp extends StatefulWidget {
  LoginSamp({Key key}) : super(key: key);

  @override
  _LoginSampState createState() => _LoginSampState();
}

class _LoginSampState extends State<LoginSamp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Form(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'enter your email',
                      border: OutlineInputBorder()
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
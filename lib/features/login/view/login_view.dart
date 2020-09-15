import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../view_models/login_viewmodel.dart';

class LoginView extends StatefulWidget {
  LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController ctrlEmail = TextEditingController();
  TextEditingController ctrlPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double scaleHeight = height / 100;
    double width = MediaQuery.of(context).size.width;
    double scaleWidth = width / 100;
    double sizeText = MediaQuery.of(context).textScaleFactor;
    return ViewModelBuilder<LoginViewModel>.reactive(
        builder: (context, model, child) {
          return Scaffold(
              body: SafeArea(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        icon: Icon(Icons.close),
                        iconSize: 35,
                        onPressed: () {
                          model.popPage();
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Login.',
                    style: TextStyle(
                      fontSize: sizeText * 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: ctrlEmail,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'enter your email',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: ctrlPass,
                    obscureText: model.isPassword,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'enter your password',
                        suffixIcon: IconButton(
                            icon: model.isPassword
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                            onPressed: () {
                              model.toggle();
                            })),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        model.login(
                          email: ctrlEmail.text,
                          password: ctrlPass.text,
                        );
                      },
                      child: Container(
                        height: scaleHeight * 8,
                        width: scaleWidth * 25,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: model.isBusy
                            ? Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Center(
                                child: Text(
                                  'submit',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: sizeText * 15,
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ));
        },
        viewModelBuilder: () => LoginViewModel());
  }
}

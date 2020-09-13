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
    return ViewModelBuilder<LoginViewModel>.reactive(
        builder: (context, model, child) {
          return Scaffold(
              body: SafeArea(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
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
                  child: Text('Login.', style: TextStyle(fontSize: 35)),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () {
                      model.login(
                        email: ctrlEmail.text,
                        password: ctrlPass.text,
                      );
                    },
                    child: model.isBusy
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(),
                          )
                        : Text('submit'),
                  ),
                ),
              ],
            ),
          ));
        },
        viewModelBuilder: () => LoginViewModel());
  }
}

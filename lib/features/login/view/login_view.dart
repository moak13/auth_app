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
              body: Container(
            child: ListView(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        model.popPage();
                      }),
                ),
                Text('Login.'),
                TextField(
                  controller: ctrlEmail,
                  decoration:
                      InputDecoration(labelText: 'Email', hintText: 'email'),
                ),
                TextField(
                  controller: ctrlPass,
                  obscureText: model.isPassword,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'password',
                      suffixIcon: IconButton(
                          icon: model.isPassword
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                          onPressed: () {
                            model.toggle();
                          })),
                ),
                RaisedButton(
                  onPressed: () {
                    model.login(email: ctrlEmail.text, password: ctrlPass.text);
                  },
                  child: model.isBusy
                      ? CircularProgressIndicator()
                      : Text('submit'),
                ),
              ],
            ),
          ));
        },
        viewModelBuilder: () => LoginViewModel());
  }
}

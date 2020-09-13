import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../view_models/signup_viewmodel.dart';

class SignupView extends StatefulWidget {
  SignupView({Key key}) : super(key: key);

  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController ctrlFirst = TextEditingController();
  TextEditingController ctrlLast = TextEditingController();
  TextEditingController ctrlEmail = TextEditingController();
  TextEditingController ctrlUsername = TextEditingController();
  TextEditingController ctrlPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupViewModel>.reactive(
        builder: (context, model, child) {
          return Scaffold(
            body: ListView(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () => model.popPage(),
                  ),
                ),
                Text('Sign Up'),
                TextField(
                  controller: ctrlFirst,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    hintText: 'enter your first name',
                  ),
                ),
                TextField(
                  controller: ctrlLast,
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    hintText: 'enter your last name',
                  ),
                ),
                TextField(
                  controller: ctrlEmail,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'enter your email',
                  ),
                ),
                TextField(
                  controller: ctrlUsername,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    hintText: 'enter your username',
                  ),
                ),
                TextField(
                  controller: ctrlPassword,
                  obscureText: model.isPassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'choose a password',
                    suffixIcon: IconButton(
                        icon: model.isPassword
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                        onPressed: () {
                          model.toggle();
                        }),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    model.signup(
                      firstname: ctrlFirst.text,
                      lastname: ctrlLast.text,
                      email: ctrlEmail.text,
                      username: ctrlUsername.text,
                      password: ctrlPassword.text,
                    );
                  },
                  child: model.isBusy
                      ? CircularProgressIndicator()
                      : Text('submit'),
                )
              ],
            ),
          );
        },
        viewModelBuilder: () => SignupViewModel());
  }
}

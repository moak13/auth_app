import 'package:auth_app/view_models/signup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

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
            body: Container(
              child: ListView(
                children: <Widget>[
                  Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () => model.popPage())),
                  Text('Sign Up'),
                  TextField(
                    controller: ctrlFirst,
                    decoration: InputDecoration(
                      labelText: 'Firstname',
                      hintText: 'firstname',
                    ),
                  ),
                  TextField(
                    controller: ctrlLast,
                    decoration: InputDecoration(
                      labelText: 'Lastname',
                      hintText: 'lastname',
                    ),
                  ),
                  TextField(
                    controller: ctrlEmail,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'email',
                    ),
                  ),
                  TextField(
                    controller: ctrlUsername,
                    decoration: InputDecoration(
                      labelText: 'Usename',
                      hintText: 'username',
                    ),
                  ),
                  TextField(
                    controller: ctrlPassword,
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
            ),
          );
        },
        viewModelBuilder: () => SignupViewModel());
  }
}

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
    double height = MediaQuery.of(context).size.height;
    double scaleHeight = height / 100;
    double width = MediaQuery.of(context).size.width;
    double scaleWidth = width / 100;
    double sizeText = MediaQuery.of(context).textScaleFactor;
    return ViewModelBuilder<SignupViewModel>.reactive(
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
                        icon: Icon(
                          Icons.clear,
                          size: 35,
                        ),
                        onPressed: () => model.popPage(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Sign Up.',
                      style: TextStyle(
                        fontSize: sizeText * 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: ctrlFirst,
                      decoration: InputDecoration(
                        labelText: 'First Name',
                        hintText: 'enter your first name',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: ctrlLast,
                      decoration: InputDecoration(
                        labelText: 'Last Name',
                        hintText: 'enter your last name',
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
                      controller: ctrlUsername,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        hintText: 'enter your username',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
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
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          model.signup(
                            firstname: ctrlFirst.text,
                            lastname: ctrlLast.text,
                            email: ctrlEmail.text,
                            username: ctrlUsername.text,
                            password: ctrlPassword.text,
                          );
                        },
                        child: Container(
                          height: scaleHeight * 8,
                          width: scaleWidth * 25,
                          decoration: BoxDecoration(
                            color: Colors.black,
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
                                      fontSize: sizeText * 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        viewModelBuilder: () => SignupViewModel());
  }
}

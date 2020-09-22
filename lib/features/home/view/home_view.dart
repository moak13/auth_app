import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../view_models/home_viewmodel.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double scaleHeight = height / 100;
    double width = MediaQuery.of(context).size.width;
    double scaleWidth = width / 100;
    double sizeText = MediaQuery.of(context).textScaleFactor;
    return ViewModelBuilder<HomeViewModel>.reactive(
        onModelReady: (model) => model.fetchUser(),
        builder: (context, model, child) {
          return Scaffold(
            key: _key,
            appBar: AppBar(
              title: Text('Home'),
            ),
            body: model.isBusy
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : !model.hasError
                    ? RefreshIndicator(
                        onRefresh: () => model.fetchUser(),
                        child: ListView(
                          padding: const EdgeInsets.all(8),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'First Name',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(model.userModel.firstname != null
                                  ? model.userModel.firstname
                                  : 'First name not found'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Last Name',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(model.userModel.lastname != null
                                  ? model.userModel.lastname
                                  : 'Last name not found'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Email',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(model.userModel.email != null
                                  ? model.userModel.email
                                  : 'Email not found'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Username',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(model.userModel.username != null
                                  ? model.userModel.username
                                  : 'Username not found'),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: InkWell(
                                  onTap: () {
                                    model.logout();
                                  },
                                  child: Container(
                                    height: scaleHeight * 8,
                                    width: scaleWidth * 25,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'logout',
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
                      )
                    : _key.currentState.showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red[200],
                          content: Text(
                            model.userError,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
          );
        },
        viewModelBuilder: () => HomeViewModel());
  }
}

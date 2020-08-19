import 'package:auth_app/view_models/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        onModelReady: (model) => model.futureToRun(),
        builder: (context, model, child) {
          return Scaffold(
            key: _key,
            appBar: AppBar(
              title: Text('Home'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.exit_to_app),
                  onPressed: () {},
                )
              ],
            ),
            body: model.isBusy
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : !model.hasError
                    ? ListView(
                        padding: const EdgeInsets.all(8),
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Name'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(model.data.success.name),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Email'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(model.data.success.email),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Username'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(model.data.success.username),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: RaisedButton(
                              onPressed: () {
                                model.logout();
                              },
                              child: Text('logout'),
                            ),
                          )
                        ],
                      )
                    : _key.currentState.showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red[200],
                          content: Text(
                            model.data.error.message,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
          );
        },
        viewModelBuilder: () => HomeViewModel());
  }
}

import 'package:flutter/material.dart';
import 'package:hostel/home_page.dart';
import 'package:hostel/dash_board.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userControler = TextEditingController();
  final passwordControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: new Icon(
          Icons.hotel,
          size: 80.0,
          color: Colors.lightBlueAccent,
        ),
      ),
    );

    final user = TextFormField(
      autofocus: false,
      controller: userControler,
      // initialValue: 'alucard@gmail.com',
      decoration: InputDecoration(
        hintText: 'Username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      controller: passwordControler,
      // initialValue: 'some password',

      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Builder(
        builder: (context) => Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.lightBlueAccent,
                shadowColor: Colors.lightBlueAccent.shade100,
                elevation: 5.0,
                child: MaterialButton(
                  minWidth: 200.0,
                  height: 42.0,
                  onPressed: () {
                    if (userControler.text == 'admin' &&
                        passwordControler.text == 'admin') {
                      //Navigator.of(context).pushNamed(HomePage.tag);
                      Navigator.of(context).pushNamed(DashBoard.tag);
                    } else {
                      Scaffold.of(context).showSnackBar(new SnackBar(
                        content:
                            new Text("Username and password is incorrect."),
                      ));
                    }
                  },
                  // color: Colors.lightBlueAccent,
                  child: Text('Log In', style: TextStyle(color: Colors.white)),
                ),
              ),
            ));

    final forgotLabel = Builder(
        builder: (context) => FlatButton(
              child: Text(
                'Forgot password?',
                style: TextStyle(color: Colors.black54),
              ),
              onPressed: () {
                Scaffold.of(context).showSnackBar(new SnackBar(
                  content: new Text("Feature is under process."),
                ));
              },
            ));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Builder(
          builder: (context) => Center(
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 24.0, right: 24.0),
                  children: <Widget>[
                    logo,
                    SizedBox(height: 48.0),
                    user,
                    SizedBox(height: 8.0),
                    password,
                    SizedBox(height: 24.0),
                    loginButton,
                    forgotLabel
                  ],
                ),
              )),
    );
  }
}

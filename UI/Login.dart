import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:grockit/Services/Auth.dart';
import 'package:grockit/Services/FacebookLogin.dart';
import 'package:grockit/UI/Homepage.dart';
import 'package:grockit/UI/Signup.dart';
import 'package:page_transition/page_transition.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  
  bool isVisible = true;
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;
  final Authentication authentication = Authentication();
  @override
  Widget build(BuildContext context) {
    return loading
        ? Homepage()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            resizeToAvoidBottomPadding: false,
            body: Container(
              height: 900.0,
              width: 500,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      colorFilter:
                          ColorFilter.mode(Colors.black87, BlendMode.darken),
                      image: AssetImage('images/bg_1.jpg'),
                      fit: BoxFit.cover)),
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(top: 150.0),
                      child: RichText(
                        text: TextSpan(
                            text: 'GR',
                            style: TextStyle(
                                fontFamily: 'Antra',
                                fontSize: 36.0,
                                color: Colors.white),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'O',
                                  style: TextStyle(
                                      fontFamily: 'Antra',
                                      fontSize: 36.0,
                                      color: Colors.lightBlue)),
                              TextSpan(
                                  text: 'CKIT',
                                  style: TextStyle(
                                      fontFamily: 'Antra',
                                      color: Colors.white,
                                      fontSize: 36.0))
                            ]),
                      )),
                  SizedBox(
                    height: 400.0,
                    width: 400.0,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 80.0, left: 80.0, right: 80.0),
                            child: TextFormField(
                              validator: (val) =>
                                  val.isEmpty ? 'Enter email' : null,
                              onChanged: (val) {
                                setState(() => email = val);
                              },
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  hintText: 'Enter email',
                                  hintStyle: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.white,
                                      fontFamily: 'Antra')),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 30.0, left: 80.0, right: 80.0),
                            child: TextFormField(
                              validator: (val) => val.length < 8
                                  ? 'Enter correct password'
                                  : null,
                              onChanged: (val) {
                                setState(() => password = val);
                              },
                              obscureText: isVisible ? true : false,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.remove_red_eye),
                                    onPressed: () {
                                      setState(() {
                                        isVisible = false;
                                      });
                                    },
                                  ),
                                  hintText: 'Enter password',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Antra',
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 70.0),
                            child: MaterialButton(
                                color: Colors.lightBlueAccent,
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    setState(() => loading = true);
                                    dynamic result = await authentication
                                        .signUpWithEmailAndPassword(
                                            email, password);
                                    if (result == null) {
                                      setState(() => error =
                                          'Sorry cannot sign in with those credentials');
                                      loading = false;
                                    }
                                  }
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      fontFamily: 'Antra', color: Colors.black),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100.0),
                    child: Row(
                      children: <Widget>[
                        FloatingActionButton(
                          heroTag: 'googleButton',
                          backgroundColor: Colors.white,
                          child: Icon(
                            EvaIcons.google,
                            color: Colors.red,
                          ),
                          onPressed: () async {
                            authentication.signInWithGoogle().whenComplete(() {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      child: Homepage(),
                                      type: PageTransitionType.rightToLeft));
                            });
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 100.0),
                          child: FloatingActionButton(
                            backgroundColor: Colors.white,
                            child: Icon(EvaIcons.facebook, color: Colors.red),
                            heroTag: 'FacebookButton',
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      child: LoginFacebook(),
                                      type: PageTransitionType.downToUp));
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0, left: 30.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'New ? Signup for a free account',
                          style: TextStyle(
                              fontFamily: 'Antra',
                              color: Colors.white,
                              fontSize: 12.0),
                        ),
                        MaterialButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      child: SignupPage(),
                                      type: PageTransitionType.downToUp));
                            },
                            child: Text(
                              'Signup',
                              style: TextStyle(
                                  fontFamily: 'Antra',
                                  color: Colors.red,
                                  fontSize: 16.0),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
  }
}

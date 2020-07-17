import 'package:flutter/material.dart';
import 'package:grockit/Services/Auth.dart';
import 'package:grockit/UI/Homepage.dart';
import 'package:grockit/UI/Login.dart';
import 'package:page_transition/page_transition.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;
  final Authentication authentication = Authentication();
  @override
  Widget build(BuildContext context) {
    return loading ? Homepage() : Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: Container(
        height: 900.0,
        width: 500.0,
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(Colors.black87, BlendMode.darken),
                image: AssetImage('images/wall1.png'),
                fit: BoxFit.cover)),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: Login(),
                              type: PageTransitionType.leftToRight));
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
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
                              color: Colors.lightBlueAccent,
                              fontSize: 36.0)),
                      TextSpan(
                          text: 'CKIT',
                          style: TextStyle(
                              fontFamily: 'Antra',
                              color: Colors.white,
                              fontSize: 36.0))
                    ]),
              ),
            ),
            SizedBox(
                height: 400.0,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 80.0, right: 80.0, top: 40.0),
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
                                  fontFamily: 'Antra',
                                  fontSize: 12.0,
                                  color: Colors.white)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 80.0, right: 80.0, top: 40.0),
                        child: TextFormField(
                          validator: (val) => val.length < 8
                              ? 'Enter password > 8 digits'
                              : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              hintText: 'Enter password',
                              hintStyle: TextStyle(
                                  fontFamily: 'Antra',
                                  fontSize: 12.0,
                                  color: Colors.white)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: MaterialButton(
                          color: Colors.lightBlueAccent,
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() => loading = true);
                              dynamic result = await authentication
                                  .registerwithEmailAndPassword(
                                      email, password);
                              if (result == null) {
                                setState(() => error =
                                    'Sorry,These credentials will not work out');
                                loading = false;
                              }
                            }
                          },
                          child: Text(
                            'Signup',
                            style: TextStyle(
                                fontFamily: 'Antra', color: Colors.black),
                          ),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

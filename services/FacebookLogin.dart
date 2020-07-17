import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:grockit/UI/Homepage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as Json;

import 'package:page_transition/page_transition.dart';

String fbname, fbemail, fbphotoUrl;

class LoginFacebook extends StatefulWidget {
  @override
  _LoginFacebookState createState() => _LoginFacebookState();
}

class _LoginFacebookState extends State<LoginFacebook> {
  @override
  Widget build(BuildContext context) {
    bool _isLoggedIn = false;
    final FacebookLogin facebookLogin = FacebookLogin();

    Future signInWithFacebook() async {
      final resultFb = await facebookLogin.logIn(['email']);

      switch (resultFb.status) {
        case FacebookLoginStatus.loggedIn:
          final token = resultFb.accessToken.token;
          final graphResponse = await http.get(
              'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
          final profile = Json.jsonDecode(graphResponse.body);
          setState(() {
            _isLoggedIn = true;
            fbname = profile['name'];
            fbemail = profile['email'];
            fbphotoUrl = profile['picture']['data']['url'];
          });
          break;

        case FacebookLoginStatus.error:
          setState(() {
            _isLoggedIn = false;
          });
          break;

        case FacebookLoginStatus.cancelledByUser:
          setState(() {
            _isLoggedIn = false;
          });
          break;
      }
    }

    Future signOutOfFacebook() async {
      facebookLogin.logOut();
      setState(() {
        _isLoggedIn = false;
      });
    }

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: MaterialButton(
                  onPressed: () async {
                    signInWithFacebook().whenComplete(() {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: Homepage(),
                              type: PageTransitionType.leftToRight));
                    });
                  },
                  child: Text('Login with facebook'),
                  color: Colors.red),
            )
          ],
        ),
      ),
    );
  }
}

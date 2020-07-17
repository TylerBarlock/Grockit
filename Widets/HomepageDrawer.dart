import 'package:flutter/material.dart';
import 'package:grockit/Screens/Draweroptions.dart';
import 'package:grockit/Services/Auth.dart';
import 'package:grockit/UI/Login.dart';
import 'package:page_transition/page_transition.dart';

class HomepageDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Authentication authentication = Authentication();
    return Container(
      width: 200.0,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CircleAvatar(
                radius: 80.0,
                backgroundImage: NetworkImage(photoUrl),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(name,
                  style: TextStyle(
                    fontFamily: 'Antra',
                    color: Colors.blueGrey,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: 20.0,
                child: Divider(color: Colors.blueGrey),
              ),
            ),
            FlatButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: MyCart(),
                          type: PageTransitionType.leftToRight));
                },
                icon: Icon(Icons.shopping_basket),
                label: Text('My Cart', style: TextStyle(fontFamily: 'Antra'))),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: FlatButton.icon(
                  onPressed: null,
                  icon: Icon(Icons.phone),
                  label:
                      Text('Consumer', style: TextStyle(fontFamily: 'Antra'))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: FlatButton.icon(
                  onPressed: null,
                  icon: Icon(Icons.access_time),
                  label:
                      Text('Upgrade', style: TextStyle(fontFamily: 'Antra'))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: FlatButton.icon(
                  onPressed: null,
                  icon: Icon(Icons.settings),
                  label:
                      Text('Settings', style: TextStyle(fontFamily: 'Antra'))),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Divider(
                color: Colors.blueGrey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: MaterialButton(
                color: Colors.lightBlue,
                onPressed: () async {
                  authentication.signOutOfGoogle().whenComplete(() {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: Login(), type: PageTransitionType.upToDown));
                  });
                },
                child: Text(
                  'Logout',
                  style: TextStyle(fontFamily: 'Antra', color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 40),
              child: Text('Grockit v1.0',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'Antra',
                      color: Colors.blueGrey)),
            )
          ],
        ),
      ),
    );
  }
}

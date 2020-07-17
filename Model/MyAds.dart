import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyAdsbooksmanual extends StatefulWidget {
  @override
  _MyAdsbooksmanualState createState() => _MyAdsbooksmanualState();
}

class _MyAdsbooksmanualState extends State<MyAdsbooksmanual> {
  String searchString;
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Container(
                  constraints: BoxConstraints(maxWidth: 300.0),
                  child: TextField(
                      style: TextStyle(fontFamily: 'Antra'),
                      decoration: InputDecoration(
                        hintText: 'Search here',
                        hintStyle: TextStyle(fontFamily: 'Bangers'),
                      ),
                      controller: textEditingController,
                      onChanged: (val) {
                        setState(() {
                          searchString = val.toLowerCase();
                        });
                      }),
                ),
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: (searchString == null || searchString.trim() == '')
                        ? Firestore.instance
                            .collection('myProducts')
                            .snapshots()
                        : Firestore.instance
                            .collection('myProducts')
                            .where('searchIndex', arrayContains: searchString)
                            .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error + ${snapshot.error}');
                      }
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return SizedBox(
                            child: LinearProgressIndicator(),
                          );
                        case ConnectionState.none:
                          return Text('Oops no data present');

                        case ConnectionState.done:
                          return Text('Oops no data present',
                              style: TextStyle(
                                  fontFamily: 'gabo', color: Colors.black));

                        default:
                          return new ListView(
                              children: snapshot.data.documents
                                  .map((DocumentSnapshot document) {
                            return new ListTile(
                              title: Text(document['prodcut']),
                            );
                          }).toList());
                      }
                    },
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}

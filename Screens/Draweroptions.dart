import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grockit/Services/Auth.dart';
import 'package:grockit/UI/Homepage.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    Future getData() async {
      final database = Firestore.instance;
      QuerySnapshot snapshot = await database.collection('cart').getDocuments();
      return snapshot.documents;
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                PageTransition(
                    child: Homepage(), type: PageTransitionType.leftToRight));
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: Text('My cart'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Text(
                'Hello! ${name}',
                style: TextStyle(fontFamily: 'Antra'),
              ),
            ),
            Text('You have following items in the cart',
                style: TextStyle(
                  fontFamily: 'Labre',
                  fontSize: 18.0,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SizedBox(
                  height: 500.0,
                  child: FutureBuilder(
                    future: getData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: Lottie.asset('animations/loading2.json'),
                        );
                      } else {
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (_, index) {
                              return Card(
                                child: Container(
                                  child: Row(
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: 100.0,
                                              width: 100.0,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.grey,
                                                        blurRadius: 5.0)
                                                  ],
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'images/bread.jpg'),
                                                      fit: BoxFit.cover)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 190.0,
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              snapshot
                                                  .data[index].data['brand'],
                                              style: TextStyle(
                                                  fontFamily: 'Labre',
                                                  color: Colors.black,
                                                  fontSize: 20.0),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
                                              child: Text(
                                                'Price : ${snapshot.data[index].data['price']}',
                                                style: TextStyle(
                                                    fontFamily: 'Labre',
                                                    color: Colors.blueGrey,
                                                    fontSize: 20.0),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
                                              child: Text(
                                                'Offer : ${snapshot.data[index].data['offer']}% offer',
                                                style: TextStyle(
                                                    fontFamily: 'Labre',
                                                    color: Colors.greenAccent,
                                                    fontSize: 16.0),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      MaterialButton(
                                        onPressed: () {},
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.blueGrey,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      }
                    },
                  )),
            ),
            MaterialButton(
              color: Colors.lightBlueAccent,
              onPressed: () {},
              child: Text('Checkout'),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grockit/UI/Homepage.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class Eggs extends StatefulWidget {
  @override
  _EggsState createState() => _EggsState();
}

class _EggsState extends State<Eggs> {
  @override
  Widget build(BuildContext context) {
    Future getData() async {
      final database = Firestore.instance;
      QuerySnapshot snapshot = await database.collection('eggs').getDocuments();
      return snapshot.documents;
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: Homepage(), type: PageTransitionType.leftToRight));
            },
          ),
          centerTitle: true,
          title: Text(
            'Eggs',
            style: TextStyle(
                fontFamily: 'Antra', color: Colors.white, fontSize: 18.0),
          ),
        ),
        body: FutureBuilder(
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
                    return GestureDetector(
                      onTap: (){
                       showCupertinoDialog(
                          context: context,
                          builder: (context) => CupertinoAlertDialog(
                                title: Text(
                                    'Add ${snapshot.data[index].data['product']} to cart?'),
                                actions: <Widget>[
                                  CupertinoButton(
                                    onPressed: () async {
                                      Firestore.instance
                                          .collection('Mycart')
                                          .add({
                                        'product': snapshot
                                            .data[index].data['product'],
                                        'brand':
                                            snapshot.data[index].data['brand'],
                                        'price':
                                            snapshot.data[index].data['price'],
                                        'offer':
                                            snapshot.data[index].data['offer'],
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: Text('Yes',
                                        style: TextStyle(
                                            fontFamily: 'Antra',
                                            color: Colors.lightBlue,
                                            fontSize: 14.0)),
                                  ),
                                  CupertinoButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('No',
                                        style: TextStyle(
                                            fontFamily: 'Antra',
                                            color: Colors.red,
                                            fontSize: 14.0)),
                                  )
                                ],
                              ));
                      },
                      child: Card(
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
                                              image: NetworkImage(snapshot.data[index].data['imageUrl']),
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
                                      snapshot.data[index].data['brand'],
                                      style: TextStyle(
                                          fontFamily: 'Labre',
                                          color: Colors.black,
                                          fontSize: 20.0),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Text(
                                        'Price : ${snapshot.data[index].data['price']}',
                                        style: TextStyle(
                                            fontFamily: 'Labre',
                                            color: Colors.blueGrey,
                                            fontSize: 20.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
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
                      ),
                    );
                  });
            }
          },
        ));
  }
}

class Bread extends StatefulWidget {
  @override
  _BreadState createState() => _BreadState();
}

class _BreadState extends State<Bread> {
  @override
  Widget build(BuildContext context) {
    Future getData() async {
      final database = Firestore.instance;
      QuerySnapshot snapshot =
          await database.collection('breads').getDocuments();
      return snapshot.documents;
    }

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: Homepage(), type: PageTransitionType.leftToRight));
            },
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text('Breads',
              style: TextStyle(
                  fontFamily: 'Antra', color: Colors.white, fontSize: 18.0)),
        ),
        body: FutureBuilder(
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
                                            image:
                                                AssetImage('images/bread.jpg'),
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
                                    snapshot.data[index].data['brand'],
                                    style: TextStyle(
                                        fontFamily: 'Labre',
                                        color: Colors.black,
                                        fontSize: 20.0),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Text(
                                      'Price : ${snapshot.data[index].data['price']}',
                                      style: TextStyle(
                                          fontFamily: 'Labre',
                                          color: Colors.blueGrey,
                                          fontSize: 20.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
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
        ));
  }
}

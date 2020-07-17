import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grockit/Screens/Category.dart';
import 'package:grockit/Screens/Timings.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class MainHomePage extends StatefulWidget {
  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    Future getData() async {
      var database = Firestore.instance;
      QuerySnapshot snapshot =
          await database.collection('deals').getDocuments();
      return snapshot.documents;
    }

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 100.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 500.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/grocery.jpg'),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: SizedBox(
              height: 100.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: Eggs(),
                                type: PageTransitionType.rightToLeft));
                      },
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 30.0,
                              backgroundImage: AssetImage('images/eggs.jpg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text('Eggs',
                                  style: TextStyle(
                                    fontFamily: 'Antra',
                                    color: Colors.blueGrey,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: AssetImage('images/sauce.jpg'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text('sauce',
                                style: TextStyle(
                                  fontFamily: 'Antra',
                                  color: Colors.blueGrey,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: Bread(),
                                type: PageTransitionType.rightToLeft));
                      },
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 30.0,
                              backgroundImage: AssetImage('images/bread.jpg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text('bread',
                                  style: TextStyle(
                                    fontFamily: 'Antra',
                                    color: Colors.blueGrey,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: AssetImage('images/drinks.jpg'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text('drinks',
                                style: TextStyle(
                                  fontFamily: 'Antra',
                                  color: Colors.blueGrey,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: AssetImage('images/snacks.jpg'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text('snacks',
                                style: TextStyle(
                                  fontFamily: 'Antra',
                                  color: Colors.blueGrey,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: AssetImage('images/rice.jpg'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text('rice',
                                style: TextStyle(
                                  fontFamily: 'Antra',
                                  color: Colors.blueGrey,
                                )),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 300.0,
            child: Divider(
              color: Colors.blueGrey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              'Timings',
              style: TextStyle(fontFamily: 'Antra', color: Colors.lightGreen),
            ),
          ),
          SizedBox(
            height: 100.0,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ActionChip(
                    backgroundColor: Colors.deepOrangeAccent,
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: Morning(),
                              type: PageTransitionType.downToUp));
                    },
                    label: Text(
                      'Morning',
                      style: TextStyle(fontFamily: 'Labre'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ActionChip(
                    backgroundColor: Colors.lightBlueAccent,
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: Afternoon(),
                              type: PageTransitionType.downToUp));
                    },
                    label: Text(
                      'Afternoon',
                      style: TextStyle(fontFamily: 'Labre'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ActionChip(
                    backgroundColor: Colors.yellow,
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: Evening(),
                              type: PageTransitionType.downToUp));
                    },
                    label: Text(
                      'Evening',
                      style: TextStyle(fontFamily: 'Labre'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ActionChip(
                    backgroundColor: Colors.grey,
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: Night(),
                              type: PageTransitionType.downToUp));
                    },
                    label: Text(
                      'Night',
                      style: TextStyle(fontFamily: 'Labre'),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 100.0,
            width: 100.0,
            child: Lottie.asset('animations/cart.json'),
          ),
          Text(
            'Top products',
            style:
                TextStyle(fontFamily: 'Antra', color: Colors.lightBlueAccent),
          ),
          SizedBox(
              height: 400.0,
              child: FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: SizedBox(
                        height: 210.0,
                        width: 200.0,
                        child: Lottie.asset('animations/listLoading.json'),
                      ),
                    );
                  } else {
                    return GridView.builder(
                        itemCount: snapshot.data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Container(
                                        height: 100.0,
                                        width: 150.0,
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
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Text(
                                          snapshot.data[index].data['product'],
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: 'Labre')),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                          'Price : ${snapshot.data[index].data['price']}',
                                          style: TextStyle(
                                              fontFamily: 'Labre',
                                              color: Colors.blueGrey)),
                                    )
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border:
                                        Border.all(color: Colors.blueGrey))),
                          );
                        });
                  }
                },
              )),
        ],
      ),
    );
  }
}

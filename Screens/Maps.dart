import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  GoogleMapController controller;

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  void initMarker(specify, specifyId) async {
    var markerIdVal = specifyId;
    final MarkerId markerId = MarkerId(markerIdVal);
    final Marker marker = Marker(
      markerId: markerId,
      position:
          LatLng(specify['location'].latitude, specify['location'].longitude),
      infoWindow: InfoWindow(title: 'Shop', snippet: specify['address']),
    );
    setState(() {
      markers[markerId] = marker;
    });
  }

  getMarkerData() async {
    Firestore.instance.collection('data').getDocuments().then((myMockDoc) {
      if (myMockDoc.documents.isNotEmpty) {
        for (int i = 0; i < myMockDoc.documents.length; i++) {
          initMarker(myMockDoc.documents[i].data, myMockDoc.documents[i].documentID);
        }
      }
    });
  }

  @override
  void initState() {
    getMarkerData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    Set<Marker> getMarker() {
      return <Marker>[
        Marker(
            markerId: MarkerId('Shop'),
            position: LatLng(21.1458, 79.0882),
            icon: BitmapDescriptor.defaultMarker,
            infoWindow: InfoWindow(title: 'Home'))
      ].toSet();
    }

    return Scaffold(
        body: GoogleMap(
            markers: Set<Marker>.of(markers.values),
            mapType: MapType.normal,
            initialCameraPosition:
                CameraPosition(target: LatLng(21.1458, 79.0882), zoom: 12.0),
            onMapCreated: (GoogleMapController controller) {
              controller = controller;
            }));
  }
}

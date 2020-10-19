import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';
import 'package:location/location.dart';
import 'package:wefresco/screens/Welcome/welcome_screen.dart';
import 'package:wefresco/services/auth.dart';

// https://fireship.io/lessons/flutter-realtime-geolocation-firebase/
// https://fireship.io/tags/flutter/
class HomePageScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //onWillPop: () async => false,
      child: Scaffold(
        body: FireMap(),
      ),
    );
  }
}

class FireMap extends StatefulWidget {
  @override
  _FireMapState createState() => _FireMapState();
}

class _FireMapState extends State<FireMap> {
  // Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  final Set<Marker> _markers = {};
  final LatLng _center = const LatLng(45.1903, 7.8883);
  GoogleMapController mapController;
  String _mapStyle;
  CameraPosition _position;
  var location = new Location();

  Firestore firestore = Firestore.instance;
  Geoflutterfire geo = Geoflutterfire();

  final AuthService _auth = AuthService();

  // ignore: close_sinks
  BehaviorSubject<double> radius = BehaviorSubject.seeded(100.0);
  Stream<dynamic> query;
  // ignore: cancel_subscriptions
  StreamSubscription subscription;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 15,
          ),
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          onCameraMove: _updateCameraPosition,
          markers: _markers,
        ),
        Positioned(
          bottom: 70,
          right: 10,
          child: FlatButton(
            child: (Icon(
              Icons.pin_drop,
              color: Colors.white,
            )),
            color: Colors.green,
            onPressed: _addGeoPoint,
          ),
        ),
        Positioned(
          bottom: 100,
          right: 10,
          child: FlatButton(
            child: (Icon(
              Icons.person_outline,
              color: Colors.white,
            )),
            color: Colors.green,
            onPressed: () async {
              // when pressed, returns a null, which brings us to the
              // WelcomeScreen thanks to the wrapper class
              await _auth.signOut();
            },
          ),
        )
      ],
    );
  }

  /* https://stackoverflow.com/questions/57715228/error-no-name-paramenter-with-name-trackcameraposition-true-in-flutter
  static final CameraPosition _kInitialPosition = const CameraPosition(
    target: LatLng(24.150, -110.32),
    zoom: 10,
  );*/

  @override
  void initState() {
    super.initState();
    getLocationPermission();
    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }

  getLocationPermission() async {
    var location = new Location();
    try {
      location.requestPermission(); //to lunch location permission popup
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        print('Permission denied');
      }
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    print("onMapCreated");
    _startQuery();
    mapController = controller;
    mapController.setMapStyle(_mapStyle);
  }

  void _updateCameraPosition(CameraPosition position) {
    setState(() {
      _position = position;
    });
  }

  void _addMarker() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_position.target.toString()),
        position: _position.target,
        infoWindow: InfoWindow(
          title: 'Really cool place',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  Future<DocumentReference> _addGeoPoint() async {
    var pos = await _position.target;
    GeoFirePoint point =
        geo.point(latitude: pos.latitude, longitude: pos.longitude);
    return firestore
        .collection('locations')
        .add({'position': point.data, 'name': 'test'});
  }

  void _updateMarkers(List<DocumentSnapshot> documentList) {
    print("Updating markers");
    _markers.clear();
    setState(() {
      documentList.forEach((DocumentSnapshot document) {
        GeoPoint pos = document.data['position']['geopoint'];
        double distance = document.data['distance'];
        var marker = Marker(
          markerId: MarkerId(Random().nextDouble().toString()),
          position: LatLng(pos.latitude, pos.longitude),
        );
        _markers.add(marker);
      });
    });
  }

  _startQuery() async {
    // Get users location
    var pos = await location.getLocation();
    double lat = pos.latitude;
    double lng = pos.longitude;

    // Make a referece to firestore
    var ref = firestore.collection('locations');
    GeoFirePoint center = geo.point(latitude: lat, longitude: lng);

    // subscribe to query
    subscription = radius.switchMap((rad) {
      return geo.collection(collectionRef: ref).within(
          center: center, radius: rad, field: 'position', strictMode: true);
    }).listen(_updateMarkers);
  }

  @override
  dispose() {
    subscription.cancel();
    super.dispose();
  }
}

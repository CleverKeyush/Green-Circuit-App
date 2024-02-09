import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const LatLng _pShop = LatLng(19.11494141019862, 73.03381010258627);
  static const LatLng _pShopping =
      LatLng(18.967114734645097, 72.83720357892254);
  static const LatLng _pRecycling =
      LatLng(19.18162435221997, 72.95767768526244);
  static const LatLng _pApplePlex =
      LatLng(19.074181279521575, 73.00756636631382);
  static const LatLng _pGooglePlex =
      LatLng(19.121582823689547, 72.8553715765215);
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home page"),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.login),
          )
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _pGooglePlex,
          zoom: 13,
        ),
        markers: {
          Marker(
              markerId: MarkerId("_currentlocation"),
              icon: BitmapDescriptor.defaultMarker,
              position: _pGooglePlex),
          Marker(
              markerId: MarkerId("_sourceLocation"),
              icon: BitmapDescriptor.defaultMarker,
              position: _pApplePlex),
          Marker(
              markerId: MarkerId("_RecyclingLocation"),
              icon: BitmapDescriptor.defaultMarker,
              position: _pRecycling),
          Marker(
              markerId: MarkerId("_ShoppingLocation"),
              icon: BitmapDescriptor.defaultMarker,
              position: _pShopping),
          Marker(
              markerId: MarkerId("_ShopLocation"),
              icon: BitmapDescriptor.defaultMarker,
              position: _pShop),
        },
      ),
    );
  }
}

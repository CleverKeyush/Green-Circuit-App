import 'package:e_waste_catalog/pages/contact_us_page.dart';
import 'package:e_waste_catalog/pages/form_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:e_waste_catalog/pages/guide_page.dart';
import 'package:e_waste_catalog/pages/community_post.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const LatLng _pShop = LatLng(18.99736590547952, 72.84558143990309);
  static const LatLng _pShopping =
      LatLng(19.072048933758214, 72.86914433766256);
  static const LatLng _pRecycling =
      LatLng(19.09580463317271, 72.88719138304741);
  static const LatLng _pApplePlex =
      LatLng(19.120466302582074, 72.87100177816741);
  static const LatLng _pGooglePlex =
      LatLng(19.287575234058902, 73.04898777990043);
  static const LatLng _pSamsungPlex =
      LatLng(19.11241615061063, 73.01576855819027);
  static const LatLng _pRawalianPlex =
      LatLng(18.972353347799974, 73.07075745629378);
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Green Circuit"),
        backgroundColor: Colors.green.shade600,
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.login),
          )
        ],
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green.shade600, // Add green background color
                ),
                accountName: Text(
                  user!.email.toString(),
                  // Replace with user's name
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                accountEmail:
                    null, // If email is available, you can put it here
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/images/Profile2.png", // Replace with user's avatar image asset path
                  ),
                ),
              ),
              SizedBox(height: 2), // Add space between user info and menu items
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FormPage()),
                      );
                    },
                    child: Container(
                      color: Colors.green.shade700,
                      child: ListTile(
                        leading: Image.asset(
                          'assets/images/Form pic.png',
                          width: 40,
                          height: 40,
                        ),
                        title: Text(
                          "Eco Form",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10), // Add space between buttons
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EWasteManagementScreen()),
                      );
                    },
                    child: Container(
                      color: Colors.green.shade700,
                      child: ListTile(
                        leading: Image.asset(
                          'assets/images/Guide.png', // Replace with your image asset path
                          width: 40,
                          height: 40,
                        ),
                        title: Text(
                          "Guide",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10), // Add space between buttons
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CommunityPage()),
                      );
                    },
                    child: Container(
                      color: Colors.green.shade700,
                      child: ListTile(
                        leading: Image.asset(
                          'assets/images/Community1.png', // Replace with your image asset path
                          width: 40,
                          height: 40,
                        ),
                        title: Text(
                          "Community Post",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10), // Add space between buttons
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ContactUsPage()),
                      );
                    },
                    child: Container(
                      color: Colors.green.shade700,
                      child: ListTile(
                        leading: Image.asset(
                          'assets/images/ContactUs.png', // Replace with your image asset path
                          width: 40,
                          height: 40,
                        ),
                        title: Text(
                          "Contact Us",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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
            position: _pGooglePlex,
            infoWindow: InfoWindow(
              title: 'Green World Recycling, Bhiwandi',
            ),
          ),
          Marker(
            markerId: MarkerId("_sourceLocation"),
            icon: BitmapDescriptor.defaultMarker,
            position: _pApplePlex,
            infoWindow: InfoWindow(
              title:
                  'Ecotech Recycling- E-waste recycling Mumbai, Bandra Kurla Complex(BKC)',
            ),
          ),
          Marker(
            markerId: MarkerId("_RecyclingLocation"),
            icon: BitmapDescriptor.defaultMarker,
            position: _pRecycling,
            infoWindow: InfoWindow(
              title:
                  'E-Waste Scrap Recycling - Computer E-Waste Recycling Company, Asalpha, Mumbai',
            ),
          ),
          Marker(
            markerId: MarkerId("_ShoppingLocation"),
            icon: BitmapDescriptor.defaultMarker,
            position: _pShopping,
            infoWindow: InfoWindow(
              title: 'Regreen Recycling Pvt Ltd, Andheri',
            ),
          ),
          Marker(
            markerId: MarkerId("_ShopLocation"),
            icon: BitmapDescriptor.defaultMarker,
            position: _pShop,
            infoWindow: InfoWindow(
              title: 'Techeco Waste Management LLP, Parel',
            ),
          ),
          Marker(
            markerId: MarkerId("_ShopLocation"),
            icon: BitmapDescriptor.defaultMarker,
            position: _pSamsungPlex,
            infoWindow: InfoWindow(
              title: 'Recyclekaro, KoparKhairne',
            ),
          ),
          Marker(
            markerId: MarkerId("_ShopLocation"),
            icon: BitmapDescriptor.defaultMarker,
            position: _pRawalianPlex,
            infoWindow: InfoWindow(
              title: 'RECYCLING FUTURE, Bangarpada',
            ),
          ),
        },
      ),
    );
  }
}

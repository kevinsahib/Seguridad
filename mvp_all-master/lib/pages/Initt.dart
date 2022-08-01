import 'dart:async';
import 'package:flutter/material.dart';

import 'package:mvp_all/pages/login.dart';
import 'package:mvp_all/styles/colors/colors_views.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(hinit());
}

class hinit extends StatelessWidget {
  hinit({Key? key}) : super(key: key);
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(16.622504998395325, -93.09652641227521);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('PURIFICADORAS'),
          backgroundColor: ColorSelect.paginator,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back),
            color: ColorSelect.paginatorNext,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings),
              color: ColorSelect.paginatorNext,
            ),
          ],
        ),

        // centerTitle: true,
        // title: const Text('PURIFICADORAS'),
        // backgroundColor: ColorSelect.paginator,

        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: Scaffold(
  //       backgroundColor: ColorSelect.init,
  //       body: SingleChildScrollView(
  //         child: Column(
  //           children: [
  //             Container(
  //               margin: const EdgeInsets.only(top: 60),
  //               child: const Text(
  //                 'PURIFICADORAS',
  //                 style: TextStyle(
  //                     fontSize: 16,
  //                     fontWeight: FontWeight.bold,
  //                     color: Colors.black),
  //               ),
  //             ),
  //             // Container(
  //             //   margin: const EdgeInsets.only(top: 110),
  //             //   child: const Text(
  //             //     'DOOR WATER ',
  //             //     style: TextStyle(
  //             //       fontSize: 28,
  //             //       color: ColorSelect.texButton1,
  //             //       fontWeight: FontWeight.w600,
  //             //     ),
  //             //     textAlign: TextAlign.left,
  //             //   ),
  //             // ),
  //             Center(
  //               child: Container(
  //                 height: 200,
  //                 margin: const EdgeInsets.only(left: 20, right: 20, top: 50),
  //                 child: Image.asset(
  //                   'assets/images/garrafon.png',
  //                   width: 300,
  //                 ),
  //               ),
  //             ),
  //             Container(
  //               width: 340,
  //               height: 48,
  //               margin: const EdgeInsets.only(
  //                 left: 24,
  //                 right: 24,
  //                 top: 30,
  //               ),
  //               child: ElevatedButton(
  //                 onPressed: () {
  //                   Navigator.push(
  //                       context,
  //                       MaterialPageRoute(
  //                           builder: (context) => const loginn()));
  //                 },
  //                 child: Row(children: const [
  //                   Padding(padding: EdgeInsets.symmetric(horizontal: 19)),
  //                   Icon(Icons.supervised_user_circle),
  //                   Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
  //                   Text("Ingresar como Cliente",
  //                       style: TextStyle(fontSize: 19),
  //                       textAlign: TextAlign.center),
  //                 ]),
  //                 style: OutlinedButton.styleFrom(
  //                   shape: StadiumBorder(),
  //                   alignment: Alignment.centerLeft,
  //                   primary: ColorSelect.btnblack,
  //                   fixedSize: const Size(50, 50),
  //                   backgroundColor: ColorSelect.init,
  //                 ),
  //               ),
  //             ),
  //             Container(
  //               width: 340,
  //               height: 48,
  //               margin: const EdgeInsets.only(
  //                 left: 24,
  //                 right: 24,
  //                 top: 40,
  //               ),
  //               child: ElevatedButton(
  //                 onPressed: () {
  //                   Navigator.push(
  //                       context,
  //                       MaterialPageRoute(
  //                           builder: (context) => const loginn()));
  //                 },
  //                 child: Row(children: const [
  //                   Padding(padding: EdgeInsets.symmetric(horizontal: 19)),
  //                   Icon(Icons.business),
  //                   Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
  //                   Text("Ingresar como Dueño",
  //                       style: TextStyle(fontSize: 19),
  //                       textAlign: TextAlign.center),
  //                 ]),
  //                 style: OutlinedButton.styleFrom(
  //                   shape: StadiumBorder(),
  //                   alignment: Alignment.centerLeft,
  //                   primary: ColorSelect.btnblack,
  //                   fixedSize: const Size(50, 50),
  //                   backgroundColor: ColorSelect.buttoof,
  //                 ),
  //               ),
  //             ),
  //             Container(
  //               margin: const EdgeInsets.only(top: 140),
  //               child: const Text(
  //                 '¡HASTA LA PUERTA DE TU HOGAR!',
  //                 style: TextStyle(
  //                   fontSize: 20,
  //                   color: ColorSelect.btnBackgrounBo2,
  //                   fontWeight: FontWeight.w500,
  //                 ),
  //                 textAlign: TextAlign.left,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }


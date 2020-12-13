import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:medicine_reminder/Enhancements/LanguageConfig/AppLocalizations.dart';
import 'package:medicine_reminder/PatientController/PatientAddPage.dart';
import 'package:medicine_reminder/PatientList/SelfReminder/Selfmain.dart';
import 'package:medicine_reminder/PatientScreen/QrGen.dart';
import 'package:medicine_reminder/StoreLocator/screens/search.dart';
import 'configuration.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:medicine_reminder/PatientList/Profile/ProfilePage.dart';
import 'package:medicine_reminder/PatientList/Settings/Settings_UI.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  String _fcmToken = null;


  // _scan() async {
  //   String temp = await scanner.scan();
  //   setState(() {
  //     _fcmToken = temp;
  //   });
  // }
  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#bb86fe", "Cancel", true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _fcmToken = barcodeScanRes;
    });
    if (_fcmToken != null) {
      print("Valid");
      print(_fcmToken);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PatientAddPage(_fcmToken)));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => QrGen()));
    }
  }
  // _scan() async {
  //   String temp = await scanner.scan();
  //   //String temp = await BarcodeScanner.scan();
  //   setState(() {
  //     _fcmToken = temp;
  //   });
  //   if (_fcmToken != null) {
  //     print("Valid");
  //     print(_fcmToken);
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => PatientAddPage(_fcmToken)));
  //   } else {
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => QrGen()));
  //   }
  // }

  Future navigateToSubPage(context, int index) async {
    switch (index) {
      case 0:
         scanQR();
        break;//
      case  1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MedicineReminder()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Search()));
        break;
      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfilePage()));
        break;
      case 4:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SettingsPage()));
        break;


    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Color(0xff121212),
        image: new DecorationImage(
          image: new AssetImage('assets/images/bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      height: double.infinity,

      padding: EdgeInsets.only(top: 50, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage:
                    NetworkImage('https://via.placeholder.com/150'),
                backgroundColor: Colors.transparent,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Care Giver Name',
                    style: TextStyle(
                        fontFamily: 'Circular',
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text('Active Status',
                      style: TextStyle(
                          fontFamily: 'Circular',
                          color: Colors.white, fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
          SizedBox(
            width: 10,
            height: 30,
          ),
          Flexible(
            child: FractionallySizedBox(
              heightFactor: 0.8,
              child: SingleChildScrollView(
                child: Column(
                  children: drawerItems
                      .map((element) => Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: GestureDetector(
                            onTap: () {
                              navigateToSubPage(context, element['index']);
                            },
                            child: Row(
                              children: [
                                Icon(
                                  element['icon'],
                                  color: Color(0xffbb86fe),
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(element['title'],
                                    style: TextStyle(
                                        color: Color(0xfff2e7fe),
                                        fontFamily: 'Circular',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20))
                              ],
                            ),
                          )))
                      .toList(),
                ),
              ),
            ),
          ),

          // SizedBox(
          //   width: 10,
          //   height: 180,
          // ),
          // Row(
          //   children: [
          //     GestureDetector(
          //         onTap: () async {
          //           await FirebaseAuth.instance.signOut();
          //         },
          //         child: Row(
          //           children: [
          //             SizedBox(
          //               width: 10,
          //               height: 20,
          //             ),
          //             Image.asset(
          //               'assets/images/logout.png',
          //               height: 25.0,
          //               width: 25.0,
          //               // allowDrawingOutsideViewBox: true,
          //             ),
          //             SizedBox(
          //               width: 10,
          //             ),
          //             Text(
          //               AppLocalizations.of(context).translate('Log_Out'),
          //               style: TextStyle(
          //                   color: Color(0xfff2e7fe),
          //                   fontFamily: 'Circular',
          //                   fontWeight: FontWeight.bold,
          //                   fontSize: 28),
          //             )
          //           ],
          //         )),
          //     SizedBox(
          //       width: 10,
          //       height: 80,
          //     ),
          //   ],
          // ),
          // Flexible(
          //     child: FractionallySizedBox(
          //       heightFactor: 0.00000000001,
          //     )
          SizedBox(height: 30,)
        ],
      ),
    );
  }
}

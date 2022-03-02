// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:numberpicker/numberpicker.dart';
// import 'package:page_transition/page_transition.dart';
// import '../ad_details/ad_state.dart';
// import 'height_weight.dart';
//
// enum Gender {
//   male,
//   female,
// }
//
// Gender SelectedGender;
//
// class SelectorPage extends StatefulWidget {
//   @override
//   _SelectorPageState createState() => _SelectorPageState();
// }
//
// class _SelectorPageState extends State<SelectorPage> {
//   int _AgeOfUser = 20;
//
//   BannerAd _bannerAd;
//   bool _isBannerAdReady = false;
//
//   @override
//   void initState() {
//     _bannerAd = BannerAd(
//       adUnitId: AdHelper.bannerAdUnitId,
//       request: AdRequest(),
//       size: AdSize.banner,
//       listener: AdListener(
//         onAdLoaded: (_) {
//           setState(() {
//             _isBannerAdReady = true;
//           });
//         },
//         onAdFailedToLoad: (ad, err) {
//           print('Failed to load a banner ad: ${err.message}');
//           _isBannerAdReady = false;
//           ad.dispose();
//         },
//       ),
//     );
//     _bannerAd.load();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blueGrey[900],
//         centerTitle: true,
//         title: Text(
//           "BMI CALCULATOR",
//           style: TextStyle(
//             color: Colors.amberAccent,
//             fontSize: 30,
//             fontWeight: FontWeight.w900,
//             letterSpacing: 2,
//           ),
//         ),
//       ),
//       backgroundColor: Colors.blueGrey[900],
//       body: SafeArea(
//         child: Stack(
//           children: [
//             SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 20, right: 20),
//                     child: Container(
//                       width: double.infinity,
//                       height: 40,
//                       child: Center(
//                         child: Text(
//                           "SELECT GENDER:",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 25,
//                             fontWeight: FontWeight.w900,
//                             letterSpacing: 2,
//                           ),
//                         ),
//                       ),
//                       padding: EdgeInsets.only(
//                         top: 5,
//                         bottom: 5,
//                       ),
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           begin: Alignment.centerLeft,
//                           end: Alignment.centerRight,
//                           colors: [
//                             const Color(0xff96f0ae),
//                             const Color(0xff00e676),
//                           ],
//                         ),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         GestureDetector(
//                           child: Container(
//                             height: 230,
//                             width: 150,
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                   begin: Alignment.topCenter,
//                                   end: Alignment.bottomCenter,
//                                   colors: SelectedGender == Gender.male
//                                       ? [
//                                           const Color(0xff90caf9),
//                                           const Color(0xff1565c0),
//                                         ]
//                                       : [
//                                           const Color(0xff00e676),
//                                           const Color(0xff96f0ae),
//                                         ]),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 Container(
//                                   child: Text(
//                                     "MAN",
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 25,
//                                       fontWeight: FontWeight.w600,
//                                       letterSpacing: 2,
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Container(
//                                   height: 150,
//                                   width: 150,
//                                   padding: EdgeInsets.all(10),
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage("assets/m.png"),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           onTap: () {
//                             setState(() {
//                               SelectedGender = Gender.male;
//                             });
//                             print('its getting pressed 1');
//                           },
//                         ),
//                         SizedBox(
//                           width: 20,
//                         ),
//                         GestureDetector(
//                           child: Container(
//                             height: 230,
//                             width: 150,
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                   begin: Alignment.topCenter,
//                                   end: Alignment.bottomCenter,
//                                   colors: SelectedGender == Gender.female
//                                       ? [
//                                           const Color(0xffce93d8),
//                                           const Color(0xffd500f9),
//                                         ]
//                                       : [
//                                           const Color(0xff00e676),
//                                           const Color(0xff96f0ae),
//                                         ]),
//                               color: Colors.greenAccent[700],
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 Container(
//                                   child: Text(
//                                     "WOMAN",
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 25,
//                                       fontWeight: FontWeight.w600,
//                                       letterSpacing: 2,
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Container(
//                                   height: 150,
//                                   width: 150,
//                                   padding: EdgeInsets.all(10),
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage("assets/f.png"),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           onTap: () {
//                             setState(() {
//                               SelectedGender = Gender.female;
//                             });
//                             print('its getting pressed 2');
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 20, right: 20),
//                     child: Container(
//                       height: 190,
//                       width: double.infinity,
//                       padding: EdgeInsets.only(
//                           top: 5, bottom: 5, right: 10, left: 10),
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                           colors: [
//                             const Color(0xff00e676),
//                             const Color(0xff96f0ae),
//                           ],
//                         ),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Column(
//                         children: [
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Text(
//                             'SELECT AGE:',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 30,
//                               fontWeight: FontWeight.w900,
//                               letterSpacing: 2,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           NumberPicker(
//                             selectedTextStyle: TextStyle(
//                               fontSize: 50,
//                               fontWeight: FontWeight.w700,
//                               color: Colors.black,
//                             ),
//                             textStyle: TextStyle(
//                               fontSize: 20,
//                               color: Colors.black54,
//                             ),
//                             value: _AgeOfUser,
//                             minValue: 0,
//                             maxValue: 100,
//                             step: 1,
//                             itemHeight: 100,
//                             axis: Axis.horizontal,
//                             onChanged: (value) =>
//                                 setState(() => _AgeOfUser = value),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               border: Border.all(
//                                 color: Colors.black,
//                                 width: 3,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     width: 150,
//                     height: 50,
//                     padding: EdgeInsets.only(left: 16, right: 16),
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         begin: Alignment.topRight,
//                         end: Alignment.bottomLeft,
//                         colors: [
//                           const Color(0xffff6f00),
//                           const Color(0xffffd54f),
//                         ],
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: TextButton(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             child: Text(
//                               "NEXT",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 20,
//                                 //fontWeight: FontWeight.w900,
//                                 letterSpacing: 2,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 2,
//                           ),
//                           Icon(
//                             Icons.arrow_forward_ios,
//                             color: Colors.white,
//                           ),
//                         ],
//                       ),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           PageTransition(
//                             type: PageTransitionType.rightToLeftWithFade,
//                             child: HomePage(),
//                           ),
//                         );
//                         print("Age: ${_AgeOfUser}");
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             if (_isBannerAdReady)
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Container(
//                   width: _bannerAd.size.width.toDouble(),
//                   height: _bannerAd.size.height.toDouble(),
//                   child: AdWidget(ad: _bannerAd),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

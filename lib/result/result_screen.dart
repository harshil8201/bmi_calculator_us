import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../ad_details/ad_state.dart';

class ResultScreen extends StatefulWidget {
  final bmiModel;

  ResultScreen({this.bmiModel});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

  InterstitialAd _interstitialAd;
  bool isLoaded;

  @override
  void initState() {
    super.initState();

    _interstitialAd = InterstitialAd(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: AdRequest(),
      listener: AdListener(
        onAdClosed: (ad) {
          print("Closed Ad");
        },
        onAdOpened: (ad) {
          print("Opened Ad");
        },
      ),
    );
    _interstitialAd.load();
    // initializing();
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "BODY MASS INDEX",
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 25,
            fontWeight: FontWeight.w900,
            letterSpacing: 2,
            wordSpacing: 3,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    width: 400,
                    child: widget.bmiModel.isNormal
                        ? Image.asset(
                            "assets/happy1.png",
                            fit: BoxFit.contain,
                          )
                        : Image.asset(
                            "assets/sad1.png",
                            fit: BoxFit.contain,
                          ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  widget.bmiModel.bmi == null || widget.bmiModel.bmi == 0
                      ? Text(
                          "You Entered Nothing.",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            wordSpacing: 1,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      : Text(
                          "YOUR BMI IS ${widget.bmiModel.bmi.round()}.",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 34,
                            wordSpacing: 3,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${widget.bmiModel.comments}.",
                    style: TextStyle(
                      color: Colors.greenAccent[700],
                      fontSize: 18,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  widget.bmiModel.isNormal
                      ? Text(
                          "YOUR BMI IS NORMAL.",
                          style: TextStyle(
                            color: Colors.amberAccent,
                            fontSize: 18,
                            wordSpacing: 3,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      : Text(
                          "YOUR BMI IS NOT NORMAL.",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            wordSpacing: 4,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xff00e676),
                          const Color(0xff96f0ae),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Container(
                            child: Text(
                              "LET CALCULATE AGAIN",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        _interstitialAd.show();
                        Navigator.pop(context);
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => SelectorPage()));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

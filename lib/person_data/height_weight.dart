import 'package:bmi_calculator_us/result/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:page_transition/page_transition.dart';
import '../ad_details/ad_state.dart';
import 'bmi_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _heightOfUser = 0;
  double _weightOfUser = 0;
  double _bmi;
  BMIModel _bmiModel;

  BannerAd _bannerAd;
  bool _isBannerAdReady = false;

  @override
  void initState() {
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: AdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );
    _bannerAd.load();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 25,
            fontWeight: FontWeight.w900,
            letterSpacing: 2,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              //height: double.infinity,
              width: double.infinity,
              padding: EdgeInsets.only(top: 7, left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/images/Icon.png'),
                    width: 150,
                    height: 150,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xff2196f3),
                          const Color(0xff4fc3f7),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "HEIGHT (Cm):",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          onChanged: (value) {
                            _heightOfUser = double.parse(value);
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: "Enter Your Height in cm.",
                            icon: Icon(
                              Icons.accessibility_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xff00e676),
                          const Color(0xff96f0ae),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "WEIGHT (Kg):",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              _weightOfUser = double.parse(value);
                            });
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: "Enter Your Weight in Kg.",
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          const Color(0xffff6f00),
                          const Color(0xffffd54f),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 200,
                    padding: EdgeInsets.only(left: 16, right: 16),
                    // ignore: deprecated_member_use
                    child: FlatButton.icon(
                      onPressed: () {
                        setState(() {
                          if ((_heightOfUser == 0 && _weightOfUser == 0) ||
                              (_heightOfUser == null && _weightOfUser == 0) ||
                              (_heightOfUser == 0 && _weightOfUser == null)) {
                            _bmiModel = BMIModel(
                                bmi: _bmi,
                                isNormal: false,
                                comments: "Please Enter & Come Back");
                            print("Entered Nothing : 0");
                          } else {
                            _bmi = (_weightOfUser) /
                                (_heightOfUser * _heightOfUser / (10000));

                            if (_bmi >= 18.5 && _bmi <= 25) {
                              _bmiModel = BMIModel(
                                  bmi: _bmi,
                                  isNormal: true,
                                  comments: "You are Totally Fit");
                            } else if (_bmi < 18.5) {
                              _bmiModel = BMIModel(
                                  bmi: _bmi,
                                  isNormal: false,
                                  comments: "You are Underweight");
                            } else if (_bmi > 25 && _bmi <= 30) {
                              _bmiModel = BMIModel(
                                  bmi: _bmi,
                                  isNormal: false,
                                  comments: "You are Overweight");
                            } else {
                              _bmiModel = BMIModel(
                                  bmi: _bmi,
                                  isNormal: false,
                                  comments: "You are Obese");
                            }
                            print("Height = ${_heightOfUser}");
                            print("Weight = ${_weightOfUser}");
                            print("BMI = ${_bmi}");
                          }
                        });

                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeftWithFade,
                            child: ResultScreen(
                              bmiModel: _bmiModel,
                            ),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.whatshot,
                        color: Colors.white,
                      ),
                      label: Text(
                        "CALCULATE",
                        style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 2,
                        ),
                      ),
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_isBannerAdReady)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: _bannerAd.size.width.toDouble(),
                height: _bannerAd.size.height.toDouble(),
                child: AdWidget(ad: _bannerAd),
              ),
            ),
        ],
      ),
    );
  }
}

class RadiantGradientMask extends StatelessWidget {
  RadiantGradientMask({this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => RadialGradient(
        center: Alignment.topLeft,
        radius: 0.5,
        colors: [Colors.amber[900], Colors.amber[300]],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}

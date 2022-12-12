import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_screen.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key) {
    _initAd();
  }

  late InterstitialAd? _interstitialAd;
  bool _isAdLoaded = false;
  void _initAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: onAdLoaded, onAdFailedToLoad: (error) {}),
    );
  }

  void onAdLoaded(InterstitialAd ad) {
    _interstitialAd = ad;
    _isAdLoaded = true;
    _interstitialAd?.fullScreenContentCallback =
        FullScreenContentCallback(onAdDismissedFullScreenContent: (ad) {
      _interstitialAd!.dispose();
    }, onAdFailedToShowFullScreenContent: (ad, error) {
      _interstitialAd!.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset("assets/logo.jpg"),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  if (_isAdLoaded) {
                    _interstitialAd?.show();
                  }
                  Get.to(const LoginScreen());
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                child: const Text(
                  "Accept And Continue",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class AdHelper {
  static String get interstitialAdUnitId {
    //if (Platform.isAndroid) {
    return 'ca-app-pub-3940256099942544/1033173712';
    // } else {
    //   throw UnsupportedError('Unsupported platform');
    // }
  }
}

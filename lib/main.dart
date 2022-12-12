import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:whatsapp/foget_password.dart';
import 'package:whatsapp/login_screen.dart';
import 'package:whatsapp/signup_screen.dart';
import 'home_screen.dart';
import 'welcome_screen.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        duration: 4000,
        splash: const Icon(
          Icons.whatsapp_outlined,
          size: 80,
        ),
        nextScreen: WelcomeScreen(),
        splashTransition: SplashTransition.rotationTransition,
        backgroundColor: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => WelcomeScreen()),
        GetPage(name: '/login_screen', page: () => const LoginScreen()),
        GetPage(name: '/signup_screen', page: () => const SignUpScreen()),
        GetPage(name: '/home_screen', page: () => HomeScreen()),
        GetPage(
            name: '/forget_password', page: () => const ForgetPasswordPage()),
      ],
    );
  }
}

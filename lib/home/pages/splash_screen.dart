import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sliate_mngmt_app/home/pages/login_signup/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliate_mngmt_app/home/pages/login_signup/signup_page.dart';
import 'package:sliate_mngmt_app/home/pages/onboard/onboard_screen_1.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  void initState() {
    super.initState();
    startTimer();
  }

  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasBeenLaunchedBefore =
        prefs.getBool('hasBeenLaunchedBefore') ?? false;

    if (hasBeenLaunchedBefore) {
      runApp(loginscreen());
    } else {
      await prefs.setBool('hasBeenLaunchedBefore', true);
      runApp(WelcomeScreen());
    }
  }

  // Function to navigate to the home screen after some delay
  startTimer() async {
    var duration = Duration(seconds: 5);
    return Timer(duration, route);
  }

  // Function to route to the home screen
  route() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => WelcomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Image.asset(
            'assets/images/logo.jpg',
            width: 180,
            height: 150,
          ),
          // SizedBox(height: 130),
          //   SpinKitCircle(
          //     color: Colors.deepPurple,
          //     size: 30.0,
          //   ),
          // SizedBox(height: 20),
          // SpinKitChasingDots(
          //   color: Colors.deepPurple,
          //   size: 30.0,
          // ),
          //  SizedBox(height: 80),
          //   SpinKitWave(
          //     color: Colors.deepPurple,
          //     size: 30.0,
          //   ),
          SizedBox(height: 350),
          SpinKitFadingCube(
            color: Colors.deepPurple,
            size: 30.0,
          ),
        ],
      ),
    ));
  }
}

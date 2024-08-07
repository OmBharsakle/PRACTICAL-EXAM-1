import 'dart:async';
import 'package:adv_exam_1/Screens/HomePage/View/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 3), (timer) => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage(),)),);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 180,
              height: 180,
              alignment: Alignment.center,
              child: Lottie.network(
                  'https://lottie.host/e7996068-ee28-47d6-ab92-7e0403a73222/gtmUSOy6pi.json'),
            ),
          ),
        ],
      ),
    );
  }
}

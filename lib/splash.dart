
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: LottieBuilder.asset('assets/animations/splash.json',
        fit: BoxFit.fill,),
          )),
    );
  }
}

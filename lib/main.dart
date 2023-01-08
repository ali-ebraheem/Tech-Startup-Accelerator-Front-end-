import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:tech_startup_accelerator_front_end/shared/appColor/app_color.dart';
import 'package:tech_startup_accelerator_front_end/splash.dart';
import 'package:tech_startup_accelerator_front_end/veiw/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColor.titleLargeColor,
          )
        ),
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(splash:  const SplashScreen(), nextScreen:  const  HomeScreen(),
        splashTransition: SplashTransition.decoratedBoxTransition,
        splashIconSize: double.infinity,
        duration: 1000,
      ),

    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return const Scaffold();
  }
}

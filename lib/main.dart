import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_startup_accelerator_front_end/shared/appColor/app_color.dart';
import 'package:tech_startup_accelerator_front_end/shared/sharedPreferences/shared_preferences.dart';
import 'package:tech_startup_accelerator_front_end/splash.dart';
import 'package:tech_startup_accelerator_front_end/view/home.dart';
import 'package:tech_startup_accelerator_front_end/viewModel/homeViewModel/home_view_model_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await SharedPreference.initSharedPreferences();
 var shared=SharedPreference.getData(key: 'Appearance');
 shared ?? SharedPreference.putData(key: 'Appearance', value: true);

  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => HomeViewModelCubit()..homeData(),
      child: BlocConsumer<HomeViewModelCubit, HomeViewModelState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          var homeData = HomeViewModelCubit.get(context);
          return MaterialApp(
      title: 'Flutter Demo',
      themeMode: homeData.appearanceBool ? ThemeMode.light : ThemeMode.dark,
      darkTheme: ThemeData(
        scaffoldBackgroundColor: AppColor.scaffoldBackgroundColor,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
              fontFamily: 'Poppins',
              color: Colors.white),
            titleLarge: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            )
        ),
      ),

      theme: ThemeData(
        textTheme:  const TextTheme(
          titleLarge: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColor.titleLargeColor,
          ),
          bodyLarge: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
              fontFamily: 'Poppins',
              color: AppColor.cardBodyText),
        ),
      ),
      home: AnimatedSplashScreen(
        splash:  const SplashScreen(),
        nextScreen:   const HomeScreen(),
        splashTransition: SplashTransition.decoratedBoxTransition,
        splashIconSize: double.infinity,
        duration: 1000,
      ),

    );
  },
),
);
  }
}

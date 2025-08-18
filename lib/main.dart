import 'package:fittness/views/login_screen.dart';
import 'package:fittness/views/register_screen.dart';
import 'package:fittness/views/screen.dart';
import 'package:fittness/views/splash_screen.dart';
import 'package:fittness/views/training.dart';
import 'package:fittness/widget/botnavbar.dart';
import 'package:flutter/material.dart';

void main() {
  // initializeDateFormatting("id_ID");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
      ),

      debugShowCheckedModeBanner: false,
      // title: 'Flutter Demo',
      // initialRoute: SplashScreen1.id,
      // routes: {
      //   "/login": (context) => Tugas6Flutter(),
      //   SplashScreen1.id: (context) => SplashScreen1(),
      //   // Register12.id: (context) => Register12(),
      //   BotBar1.id: (context) => BotBar1(),
      // },
      home: BotNavBar1(),
    );
  }
}

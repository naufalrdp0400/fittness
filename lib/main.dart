import 'package:fittness/views/screen.dart';
import 'package:fittness/views/splash_screen.dart';
import 'package:fittness/views/training.dart';
import 'package:fittness/widget/botnavbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting("id_ID");
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
      title: 'Flutter Demo',
      initialRoute: SplashScreen1.id,
      routes: {
        "/login": (context) => Screen1(),
        SplashScreen1.id: (context) => SplashScreen1(),
        BotNavBar1.id: (context) => BotNavBar1(),
      },
      // home: Training1(),
    );
  }
}

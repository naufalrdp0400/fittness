import 'package:fittness/extensions/navigations.dart';
import 'package:fittness/preference/shared_preference.dart';
import 'package:fittness/views/screen.dart';
import 'package:fittness/widget/botnavbar.dart';
import 'package:flutter/material.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});
  static const id = "/splash";

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    bool? isLogin = await PreferenceHandler.getLogin();
    Future.delayed(Duration(seconds: 1)).then((value) async {
      print(isLogin);
      if (isLogin == true) {
        context.pushReplacementNamed(BotNavBar1.id);
      } else {
        context.push(Screen1());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/splashscreen.jpeg"),
          ),
        ),
      ),
    );
  }
}

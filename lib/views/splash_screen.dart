import 'package:fittness/extensions/navigations.dart';
import 'package:flutter/material.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  @override
  // void initState() {
  //   super.initState();
  //   isLogin;
  // }
  // void isLogin() async {
  //   bool? isLogin = await PreferenceHandler.getLogin();
  //   Future.delayed(Duration(seconds: 3)).then((value) async {
  //     print(isLogin);
  //     if (isLogin == true) {
  //       context.pushReplacementNamed(newRouteName);
  //     } else {
  //       context.push(page);
  //     }
  //   });
  // }
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

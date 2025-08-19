import 'package:fittness/extensions/navigations.dart';
import 'package:fittness/preference/shared_preference.dart';
import 'package:fittness/views/screen.dart';
import 'package:flutter/material.dart';

class LogOut1 extends StatelessWidget {
  const LogOut1({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        PreferenceHandler.removeLogin();
        context.pushReplacement(Screen1());
      },
      child: Text("Log Out"),
    );
  }
}

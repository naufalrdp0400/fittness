import 'package:fittness/utils/app_color.dart';
import 'package:fittness/views/home_screen.dart';
import 'package:fittness/views/training.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BotNavBar1 extends StatefulWidget {
  const BotNavBar1({super.key});

  @override
  State<BotNavBar1> createState() => _BotNavBar1State();
}

class _BotNavBar1State extends State<BotNavBar1> {
  int _currentIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScr1(),
    Training1(),
    Center(child: Text("Halaman 2")),
    Center(child: Text("Halaman 2")),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions[_currentIndex]),
      bottomNavigationBar: SalomonBottomBar(
        itemShape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: AppColor.background,
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.explore),
            title: Text("Discover"),
            selectedColor: AppColor.secondary,
            unselectedColor: Colors.grey,
          ),
          SalomonBottomBarItem(
            icon: Icon(FontAwesomeIcons.stopwatch),
            title: Text("Training"),
            selectedColor: AppColor.secondary,
            unselectedColor: Colors.grey,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.bar_chart_rounded),
            title: Text("Report"),
            selectedColor: AppColor.secondary,
            unselectedColor: Colors.grey,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Settings"),
            selectedColor: AppColor.secondary,
            unselectedColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}

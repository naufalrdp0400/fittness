import 'package:fittness/extensions/navigations.dart';
import 'package:fittness/utils/app_color.dart';
import 'package:fittness/views/data_user.dart';
import 'package:fittness/views/settings.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Drawer1 extends StatefulWidget {
  const Drawer1({super.key});

  @override
  State<Drawer1> createState() => _Drawer1State();
}

class _Drawer1State extends State<Drawer1> {
  String username = '';
  String email = '';
  int _selectedIndexDrawer = 0;

  static const List<Widget> _widgetOptions = <Widget>[Setting1(), DataUser()];

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final storedUsername = prefs.getString('username') ?? 'Guest';
    final storedEmail = prefs.getString('email') ?? '';
    setState(() {
      username = storedUsername;
      email = storedEmail;
    });
  }

  void onItemTap(int index) {
    setState(() {
      _selectedIndexDrawer = index;
    });
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawerEnableOpenDragGesture: false,
      backgroundColor: AppColor.background,
      body: Center(child: _widgetOptions[_selectedIndexDrawer]),

      appBar: AppBar(
        backgroundColor: AppColor.background,
        title: Image.asset(
          "assets/images/fitnesstrsp.png",
          height: 300,
          width: 100,
          fit: BoxFit.cover,
        ),
      ),
      endDrawer: Drawer(
        backgroundColor: AppColor.background,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColor.primary, AppColor.secondary],
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.grey),
              ),
              accountName: Text(username.isNotEmpty ? username : 'Guest'),
              accountEmail: Text(email.isNotEmpty ? email : ''),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                onItemTap(0);
              },
            ),
            ListTile(
              leading: Icon(Icons.storage),
              title: Text("Database Account"),
              onTap: () {
                onItemTap(1);
              },
            ),
          ],
        ),
      ),
    );
  }
}

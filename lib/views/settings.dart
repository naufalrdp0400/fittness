import 'package:fittness/extensions/navigations.dart';
import 'package:fittness/preference/shared_preference.dart';
import 'package:fittness/utils/app_color.dart';
import 'package:fittness/views/screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Setting1 extends StatefulWidget {
  const Setting1({super.key});

  @override
  State<Setting1> createState() => _Setting1State();
}

class _Setting1State extends State<Setting1> {
  final List<Map<String, dynamic>> settings = [
    {"title": "Locations", "icons": Icons.location_on_sharp},
    {"title": "Notifications", "icons": Icons.notifications},
    {"title": "Close Friends", "icons": Icons.star},
    {"title": "Sounds", "icons": Icons.volume_up},
    {"title": "Privacy", "icons": Icons.lock},
    {"title": "Measurement Units", "icons": FontAwesomeIcons.ruler},
    {"title": "Theme", "icons": Icons.dark_mode},
    {"title": "Language", "icons": FontAwesomeIcons.globe},
    {"title": "Backup & Restore", "icons": Icons.restore},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Settings",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColor.text,
                ),
              ),
              SizedBox(height: 20),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: settings.length,
                itemBuilder: (BuildContext context, int index) {
                  final dataSettings = settings[index];
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(bottom: 10),
                      backgroundColor: AppColor.background,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},

                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppColor.oranye,
                        child: Center(
                          child: Icon(
                            dataSettings["icons"],
                            color: AppColor.text,
                            size: 20,
                          ),
                        ),
                      ),
                      title: Text(
                        dataSettings["title"],
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: AppColor.text,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  );
                },
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.oranye,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    PreferenceHandler.removeLogin();
                    context.pushReplacement(Screen1());
                  },
                  child: Text(
                    "LOG OUT",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:fittness/extensions/navigations.dart';
import 'package:fittness/utils/app_color.dart';
import 'package:fittness/utils/app_image.dart';
import 'package:fittness/views/login_screen.dart';
import 'package:fittness/views/register_screen.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(children: [buildBackground(), buildLayer()]));
  }

  Container buildBackground() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColor.background,
    );
  }

  SizedBox height(double height) => SizedBox(height: height);
  SizedBox width(double width) => SizedBox(width: width);

  SafeArea buildLayer() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImage.barble, height: 300, width: 300),
                // SizedBox(height: 0),
                Text(
                  "Make Yourself",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: AppColor.oranye,
                  ),
                ),
                Text(
                  "Better",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: AppColor.birutua,
                  ),
                ),
                SizedBox(height: 40),
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
                      context.push(Register1());
                    },
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.kuningoranye,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      context.push(Login1());
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Or Sign In With',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                  ],
                ),

                SizedBox(height: 15),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.birutua,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppImage.google, height: 16, width: 16),
                        SizedBox(width: 15),
                        Text(
                          "Google",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

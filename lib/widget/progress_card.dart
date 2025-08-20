import 'package:fittness/utils/app_color.dart';
import 'package:flutter/material.dart';

class Progresscard extends StatelessWidget {
  final String title;
  final String subtitle;

  const Progresscard({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 134,
      height: 142,
      margin: EdgeInsets.only(right: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Text(
            textAlign: TextAlign.center,
            title,
            style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            subtitle,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 12,
              color: AppColor.text,
            ),
          ),
        ],
      ),
    );
  }
}

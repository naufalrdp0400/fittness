import 'package:fittness/models/train.dart';
import 'package:fittness/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:fittness/widget/categories_icon.dart';

class TrainCard extends StatelessWidget {
  final Train data;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const TrainCard({
    super.key,
    required this.data,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.only(bottom: 20),
      child: Container(
        height: 160,
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColor.primary, AppColor.secondary],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.schedule,
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: onEdit,
                      icon: Icon(Icons.edit, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: onDelete,
                      icon: Icon(Icons.delete, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              data.categories,
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              data.stage,
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

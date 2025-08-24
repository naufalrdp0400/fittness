import 'package:fittness/models/train.dart';
import 'package:fittness/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:fittness/widget/categories_icon.dart';

class CardTrain extends StatelessWidget {
  final Train data;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const CardTrain({
    super.key,
    required this.data,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.background,
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: Icon(
                getIconForCategories(data.categories),
                size: 24,
                color: AppColor.primary,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${data.schedule}, ${data.time}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat",
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Categories: ${data.categories}",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat",
                    ),
                  ),
                  Text(
                    "Level: ${data.stage}",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat",
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  onPressed: onEdit,
                  icon: Icon(Icons.edit, color: AppColor.primary),
                ),
                IconButton(
                  onPressed: onDelete,
                  icon: Icon(Icons.delete, color: Colors.redAccent),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

IconData getIconForCategories(String categories) {
  switch (categories.toLowerCase()) {
    case 'cardio':
      return Icons.favorite;
    case 'strength':
      return Icons.fitness_center;
    case 'yoga':
      return Icons.self_improvement;
    case 'stretching':
      return Icons.accessibility_new;
    default:
      return Icons.help_outline;
  }
}

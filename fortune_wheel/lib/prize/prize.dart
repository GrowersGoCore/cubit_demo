import 'package:flutter/material.dart';

enum Category { category1, category2, category3 }

enum CategoryColor { category1, category2, category3 }

class Prize {
  Prize({
    required this.icon,
    required this.name,
    required this.category,
    required this.categoryColor,
  });

  final String icon;
  final String name;
  final Category category;
  final CategoryColor categoryColor;

  String getCategory() {
    switch (category) {
      case Category.category1:
        return 'Category 1';
      case Category.category2:
        return 'Category 2';
      case Category.category3:
        return 'Category 3';
    }
  }

  Color getCategoryColor() {
    switch (categoryColor) {
      case CategoryColor.category1:
        return const Color(0xFF605DFF);
      case CategoryColor.category2:
        return const Color(0xFF5DA8FF);
      case CategoryColor.category3:
        return const Color(0xFFAD63F6);
    }
  }
}

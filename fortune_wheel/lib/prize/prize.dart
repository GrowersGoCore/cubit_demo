enum Category {
  category1,
  category2,
  category3,
}

class Prize {
  Prize({
    required this.icon,
    required this.name,
    required this.category,
  });

  final String icon;
  final String name;
  final Category category;

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
}

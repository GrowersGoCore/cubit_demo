enum Category { category1, category2, category3 }

class Prize {
  Prize({
    required this.name,
    required this.category,
  });

  final String name;
  final Category category;

  String getCategoryName(Category category) {
    final categoryName = switch (category) {
      Category.category1 => 'Category 1',
      Category.category2 => 'Category 2',
      Category.category3 => 'Category 3',
    };
    return categoryName;
  }
}

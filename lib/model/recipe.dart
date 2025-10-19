import 'category.dart';

class Recipe {
  final String id;
  final String name;
  final String shortDescription;
  final int prepMinutes;
  final Category category;

  const Recipe({
    required this.id,
    required this.name,
    required this.shortDescription,
    required this.prepMinutes,
    required this.category,
  });
}

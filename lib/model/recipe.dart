class Recipe {
  final String id;
  String title;
  String category;
  String description;
  List<String> ingredients;
  List<String> steps;
  String? imageUrl;

  Recipe({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    List<String>? ingredients,
    List<String>? steps,
    this.imageUrl,
  })  : ingredients = ingredients ?? <String>[],
        steps = steps ?? <String>[];

  Recipe copyWith({
    String? id,
    String? title,
    String? category,
    String? description,
    List<String>? ingredients,
    List<String>? steps,
    String? imageUrl,
  }) {
    return Recipe(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      description: description ?? this.description,
      ingredients: ingredients ?? List<String>.from(this.ingredients),
      steps: steps ?? List<String>.from(this.steps),
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}

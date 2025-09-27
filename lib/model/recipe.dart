class Recipe {
  final String id;
  final String title;
  final String category; // 'Doces' | 'Salgadas' | 'Bebidas'
  final String description;
  final List<String> ingredients;
  final List<String> steps;
  final String? imageUrl;

  const Recipe({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.ingredients,
    required this.steps,
    this.imageUrl,
  });
}

import 'package:flutter/material.dart';
import '../model/recipe.dart';

class RecipeDetailsScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailsScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe.title)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (recipe.imageUrl != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(recipe.imageUrl!, height: 180, fit: BoxFit.cover),
            ),
          const SizedBox(height: 12),
          Text(recipe.description, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 16),
          Text('Ingredientes', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          ...recipe.ingredients.map(
                (ing) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('•  '),
                Expanded(child: Text(ing)),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text('Modo de preparo', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          ...List.generate(
            recipe.steps.length,
                (i) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text('${i + 1}. ${recipe.steps[i]}'),
            ),
          ),
        ],
      ),
    );
  }
}

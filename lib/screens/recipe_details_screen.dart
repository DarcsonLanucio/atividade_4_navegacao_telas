import 'package:flutter/material.dart';
import '../model/recipe.dart';

class RecipeDetailScreen extends StatelessWidget {
  static const route = '/recipe_detail';
  final Recipe recipe;
  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text(recipe.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Wrap(
                      spacing: 10,
                      children: [
                        Chip(
                          avatar: const Icon(Icons.timer_outlined, size: 16),
                          label: Text('${recipe.prepMinutes} min'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(recipe.name, style: t.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(recipe.shortDescription, style: t.bodyLarge),
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 8),
                    Text('Expanda aqui para ingredientes e preparo no futuro.', style: t.bodyMedium),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

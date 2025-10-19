import 'package:flutter/material.dart';
import '../model/recipe.dart';
import '../model/category.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback onDetails;

  const RecipeCard({super.key, required this.recipe, required this.onDetails});

  IconData _icon(Category c) {
    switch (c) {
      case Category.doces: return Icons.cake_outlined;
      case Category.salgadas: return Icons.restaurant_menu;
      case Category.bebidas: return Icons.local_drink_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onDetails,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 26,
                child: Icon(_icon(recipe.category)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipe.name,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      recipe.shortDescription,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.timer_outlined, size: 16),
                        const SizedBox(width: 4),
                        Text('${recipe.prepMinutes} min'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              FilledButton.tonalIcon(
                onPressed: onDetails,
                icon: const Icon(Icons.chevron_right),
                label: const Text('Detalhes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

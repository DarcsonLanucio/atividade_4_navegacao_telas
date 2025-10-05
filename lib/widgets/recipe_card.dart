import 'package:flutter/material.dart';
import '../model/recipe.dart';

IconData iconForCategory(String cat) {
  switch (cat) {
    case 'Doces':
      return Icons.cake_outlined;
    case 'Salgadas':
      return Icons.restaurant_menu;
    case 'Bebidas':
      return Icons.local_drink_outlined;
    default:
      return Icons.fastfood_outlined;
  }
}

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback onTap;
  final VoidCallback onLongPress; // atalho para edição

  const RecipeCard({
    super.key,
    required this.recipe,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final subtitleStyle = TextStyle(
      color: Theme.of(context).colorScheme.onSurfaceVariant,
    );

    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: InkWell(
        onTap: onTap,            // abre detalhes
        onLongPress: onLongPress, // abre edição
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              CircleAvatar(
                radius: 26,
                child: Icon(iconForCategory(recipe.category)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipe.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      recipe.description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: subtitleStyle,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}

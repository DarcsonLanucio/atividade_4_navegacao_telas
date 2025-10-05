import 'package:flutter/material.dart';
import '../model/recipe.dart';
import 'edit_recipe_screen.dart';

class RecipeDetailsScreen extends StatelessWidget {
  final Recipe recipe;
  final void Function(Recipe updated) onEdit;

  const RecipeDetailsScreen({
    super.key,
    required this.recipe,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
        actions: [
          IconButton(
            tooltip: 'Editar',
            icon: const Icon(Icons.edit),
            onPressed: () async {
              final edited = await Navigator.of(context).push<Recipe>(
                MaterialPageRoute(
                  builder: (_) => EditRecipeScreen(
                    initial: recipe,
                    isEditing: true,
                  ),
                ),
              );
              if (edited != null) {
                onEdit(edited);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Receita atualizada')),
                );
              }
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (recipe.imageUrl != null && recipe.imageUrl!.trim().isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                recipe.imageUrl!,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => _placeholder(),
              ),
            )
          else
            _placeholder(),
          const SizedBox(height: 12),
          Text(recipe.description, style: t.titleMedium),
          const SizedBox(height: 16),
          Text('Ingredientes', style: t.titleLarge),
          const SizedBox(height: 8),
          ...((recipe.ingredients.isNotEmpty
              ? recipe.ingredients
              : const <String>['Sem ingredientes.'])
              .map((ing) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('•  '),
              Expanded(child: Text(ing)),
            ],
          ))),
          const SizedBox(height: 16),
          Text('Modo de preparo', style: t.titleLarge),
          const SizedBox(height: 8),
          ...((recipe.steps.isNotEmpty
              ? recipe.steps
              : const <String>['Sem passos cadastrados.'])
              .asMap()
              .entries
              .map((e) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text('${e.key + 1}. ${e.value}'),
          ))),
        ],
      ),
    );
  }

  Widget _placeholder() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: const Center(
        child: Icon(Icons.image_outlined, size: 48),
      ),
    );
  }
}

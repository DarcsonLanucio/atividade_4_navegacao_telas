import 'package:flutter/material.dart';
import '../app_state.dart';
import '../model/category.dart';
import '../model/recipe.dart';
import '../widgets/recipe_card.dart';
import 'recipe_form_screen.dart';
import 'recipe_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  final _tabs = const [Category.doces, Category.salgadas, Category.bebidas];

  @override
  Widget build(BuildContext context) {
    final state = AppStateProvider.of(context);

    if (!state.isLoggedIn) {
      Future.microtask(() => Navigator.pushReplacementNamed(context, '/login'));
      return const SizedBox.shrink();
    }

    final currentCategory = _tabs[_index];
    final recipes = state.recipesBy(currentCategory);

    return Scaffold(
      appBar: AppBar(
        title: Text('Receitas • ${currentCategory.label}'),
        actions: [
          IconButton(
            tooltip: 'Sair',
            onPressed: () {
              state.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: recipes.isEmpty
          ? Center(child: Text('Sem receitas em ${currentCategory.label} ainda.'))
          : ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: recipes.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (_, i) {
          final r = recipes[i];
          return RecipeCard(
            recipe: r,
            onDetails: () => Navigator.pushNamed(
              context,
              RecipeDetailScreen.route,
              arguments: r,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final created = await Navigator.of(context).push<Recipe>(
            MaterialPageRoute(builder: (_) => RecipeFormScreen(initialCategory: currentCategory)),
          );
          if (created != null) {
            state.addRecipe(created);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Receita cadastrada!')),
            );
          }
        },
        icon: const Icon(Icons.add),
        label: const Text('Nova receita'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.cake_outlined), label: 'Doces'),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu), label: 'Salgadas'),
          BottomNavigationBarItem(icon: Icon(Icons.local_drink_outlined), label: 'Bebidas'),
        ],
      ),
    );
  }
}

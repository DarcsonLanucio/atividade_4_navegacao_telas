import 'package:flutter/material.dart';
import '../data/recipes.dart';
import '../model/recipe.dart';
import '../widgets/recipe_card.dart';
import 'recipe_details_screen.dart';
import 'edit_recipe_screen.dart';
import 'settings_screen.dart';
import 'about_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  static const _tabs = ['Doces', 'Salgadas', 'Bebidas'];

  // Lista mutável para CRUD em runtime
  late List<Recipe> _recipes;

  @override
  void initState() {
    super.initState();
    // Cópia defensiva do seed
    _recipes = initialRecipe.map((r) => r.copyWith()).toList();
  }

  List<Recipe> _recipesFor(String category) =>
      _recipes.where((r) => r.category == category).toList();

  void _addRecipe(Recipe newRecipe) {
    setState(() {
      _recipes.add(newRecipe);
    });
  }

  void _updateRecipe(Recipe updated) {
    setState(() {
      final idx = _recipes.indexWhere((r) => r.id == updated.id);
      if (idx != -1) _recipes[idx] = updated;
    });
  }

  void _deleteRecipeWithUndo(Recipe recipe, int index) {
    setState(() {
      _recipes.removeAt(index);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Removido: ${recipe.title}'),
        action: SnackBarAction(
          label: 'Desfazer',
          onPressed: () {
            setState(() {
              _recipes.insert(index, recipe);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final category = _tabs[_currentIndex];
    final recipes = _recipesFor(category);

    return Scaffold(
      appBar: AppBar(
        title: Text('Receitas • $category'),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            children: [
              const DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Receitas Favoritas',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text('Menu geral do aplicativo'),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Configurações'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, SettingsScreen.route);
                },
              ),
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('Sobre'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, AboutScreen.route);
                },
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (_, i) {
          final r = recipes[i];
          final indexInAll = _recipes.indexOf(r);
          return Dismissible(
            key: ValueKey(r.id),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (_) => _deleteRecipeWithUndo(r, indexInAll),
            child: RecipeCard(
              recipe: r,
              onTap: () async {
                // Toque curto: detalhes (com botão Editar)
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => RecipeDetailsScreen(
                      recipe: r,
                      onEdit: (edited) => _updateRecipe(edited),
                    ),
                  ),
                );
              },
              onLongPress: () async {
                // Atalho: edição direta
                final edited = await Navigator.of(context).push<Recipe>(
                  MaterialPageRoute(
                    builder: (_) => EditRecipeScreen(
                      initial: r,
                      isEditing: true,
                    ),
                  ),
                );
                if (edited != null) {
                  _updateRecipe(edited);
                }
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text('Nova receita'),
        onPressed: () async {
          final created = await Navigator.of(context).push<Recipe>(
            MaterialPageRoute(
              builder: (_) => EditRecipeScreen(
                initial: Recipe(
                  id: UniqueKey().toString(),
                  title: '',
                  category: _tabs[_currentIndex],
                  description: '',
                  ingredients: <String>[], // garantido não-nulo
                  steps: <String>[],       // garantido não-nulo
                ),
                isEditing: false,
              ),
            ),
          );
          if (created != null) {
            _addRecipe(created);
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.cake_outlined), label: 'Doces'),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu), label: 'Salgadas'),
          BottomNavigationBarItem(icon: Icon(Icons.local_drink_outlined), label: 'Bebidas'),
        ],
      ),
    );
  }
}

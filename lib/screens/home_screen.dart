import 'package:flutter/material.dart';
import '../data/recipes.dart';
import '../model/recipe.dart';
import '../widgets/recipe_card.dart';
import 'recipe_details_screen.dart';
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

  List<Recipe> _recipesFor(String category) =>
      kRecipes.where((r) => r.category == category).take(3).toList();

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
                    Text('Receitas Favoritas', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text('Menu geral do aplicativo'),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Configurações'),
                onTap: () {
                  Navigator.pop(context); // fecha o Drawer
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
          return RecipeCard(
            recipe: r,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => RecipeDetailsScreen(recipe: r),
                ),
              );
            },
          );
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

import 'package:flutter/material.dart';
import 'app_state.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/home_screen.dart';
import 'screens/recipe_details_screen.dart';
import 'model/recipe.dart';

void main() {
  runApp(const RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStateProvider(
      notifier: AppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Receitas',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          useMaterial3: true,
        ),
        initialRoute: '/login',
        routes: {
          '/login': (_) => const LoginScreen(),
          '/signup': (_) => const SignupScreen(),
          '/home': (_) => const HomeScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == RecipeDetailScreen.route) {
            final recipe = settings.arguments as Recipe;
            return MaterialPageRoute(
              builder: (_) => RecipeDetailScreen(recipe: recipe),
            );
          }
          return null;
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'model/app_user.dart';
import 'model/recipe.dart';
import 'model/category.dart';

class AppState extends ChangeNotifier {
  final Map<String, AppUser> _users = {}; // email -> user
  AppUser? _currentUser;

  final List<Recipe> _recipes = [
    Recipe(id: 'd1', name: 'Brigadeiro', shortDescription: 'Clássico cremoso', prepMinutes: 20, category: Category.doces),
    Recipe(id: 's1', name: 'Lasanha', shortDescription: 'Camadas e gratinado', prepMinutes: 60, category: Category.salgadas),
    Recipe(id: 'b1', name: 'Limonada', shortDescription: 'Refrescante', prepMinutes: 5, category: Category.bebidas),
  ];

  AppUser? get currentUser => _currentUser;
  bool get isLoggedIn => _currentUser != null;

  List<Recipe> recipesBy(Category c) =>
      _recipes.where((r) => r.category == c).toList(growable: false);

  String? signUp({required String name, required String email, required String password}) {
    final key = email.trim().toLowerCase();
    if (_users.containsKey(key)) return 'Este e-mail já está cadastrado.';
    _users[key] = AppUser(name: name.trim(), email: key, password: password);
    notifyListeners();
    return null; // sucesso
  }

  String? signIn({required String email, required String password}) {
    final key = email.trim().toLowerCase();
    final u = _users[key];
    if (u == null) return 'Usuário não encontrado.';
    if (u.password != password) return 'Senha incorreta.';
    _currentUser = u;
    notifyListeners();
    return null;
  }

  void signOut() {
    _currentUser = null;
    notifyListeners();
  }

  void addRecipe(Recipe r) {
    _recipes.add(r);
    notifyListeners();
  }
}

class AppStateProvider extends InheritedNotifier<AppState> {
  const AppStateProvider({
    super.key,
    required AppState notifier,
    required Widget child,
  }) : super(notifier: notifier, child: child);

  static AppState of(BuildContext context) {
    final p = context.dependOnInheritedWidgetOfExactType<AppStateProvider>();
    assert(p != null, 'AppStateProvider not found in context');
    return p!.notifier!;
  }
}

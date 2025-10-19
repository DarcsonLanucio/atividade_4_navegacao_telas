import 'package:flutter/material.dart';
import '../model/category.dart';
import '../model/recipe.dart';

class RecipeFormScreen extends StatefulWidget {
  final Category initialCategory;
  const RecipeFormScreen({super.key, required this.initialCategory});

  @override
  State<RecipeFormScreen> createState() => _RecipeFormScreenState();
}

class _RecipeFormScreenState extends State<RecipeFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _short = TextEditingController();
  final _minutes = TextEditingController();
  late Category _category;

  @override
  void initState() {
    super.initState();
    _category = widget.initialCategory;
  }

  @override
  void dispose() {
    _name.dispose();
    _short.dispose();
    _minutes.dispose();
    super.dispose();
  }

  String? _vName(String? v) {
    final s = v?.trim() ?? '';
    if (s.isEmpty) return 'Informe o nome da receita.';
    return null;
  }

  String? _vShort(String? v) {
    final s = v?.trim() ?? '';
    if (s.isEmpty) return 'Informe uma descrição curta.';
    if (s.length < 6) return 'Descrição muito curta.';
    return null;
  }

  String? _vMinutes(String? v) {
    final s = v?.trim() ?? '';
    if (s.isEmpty) return 'Informe o tempo de preparo.';
    final n = int.tryParse(s);
    if (n == null || n <= 0) return 'Informe um número positivo.';
    return null;
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;
    final recipe = Recipe(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: _name.text.trim(),
      shortDescription: _short.text.trim(),
      prepMinutes: int.parse(_minutes.text.trim()),
      category: _category,
    );
    Navigator.pop(context, recipe);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastrar Receita')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  TextFormField(
                    controller: _name,
                    decoration: const InputDecoration(
                      labelText: 'Nome da receita *',
                      prefixIcon: Icon(Icons.title),
                    ),
                    validator: _vName,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _short,
                    decoration: const InputDecoration(
                      labelText: 'Descrição curta *',
                      prefixIcon: Icon(Icons.short_text),
                    ),
                    maxLines: 2,
                    validator: _vShort,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _minutes,
                    decoration: const InputDecoration(
                      labelText: 'Tempo de preparo (min) *',
                      prefixIcon: Icon(Icons.timer_outlined),
                    ),
                    keyboardType: TextInputType.number,
                    validator: _vMinutes,
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<Category>(
                    value: _category,
                    items: Category.values
                        .map((c) => DropdownMenuItem(value: c, child: Text(c.label)))
                        .toList(),
                    onChanged: (c) => setState(() => _category = c ?? _category),
                    decoration: const InputDecoration(
                      labelText: 'Categoria *',
                      prefixIcon: Icon(Icons.category_outlined),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: _save,
                      icon: const Icon(Icons.check),
                      label: const Text('Salvar'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

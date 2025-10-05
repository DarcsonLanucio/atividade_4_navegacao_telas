import 'package:flutter/material.dart';
import '../model/recipe.dart';

class EditRecipeScreen extends StatefulWidget {
  final Recipe initial;
  final bool isEditing;

  const EditRecipeScreen({
    super.key,
    required this.initial,
    required this.isEditing,
  });

  @override
  State<EditRecipeScreen> createState() => _EditRecipeScreenState();
}

class _EditRecipeScreenState extends State<EditRecipeScreen> {
  final _formKey = GlobalKey<FormState>();

  late String _title;
  late String _category;
  late String _description;
  late String _imageUrl;
  late List<String> _ingredients;
  late List<String> _steps;

  final _categories = const ['Doces', 'Salgadas', 'Bebidas'];

  final _ingController = TextEditingController();
  final _stepController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _title = widget.initial.title;
    _category = widget.initial.category;
    _description = widget.initial.description;
    _imageUrl = widget.initial.imageUrl ?? '';
    _ingredients = List<String>.from(widget.initial.ingredients ?? <String>[]);
    _steps = List<String>.from(widget.initial.steps ?? <String>[]);
  }

  @override
  void dispose() {
    _ingController.dispose();
    _stepController.dispose();
    super.dispose();
  }

  void _addTo(List<String> list, String value) {
    if (value.trim().isEmpty) return;
    setState(() => list.add(value.trim()));
  }

  void _removeAt(List<String> list, int index) {
    setState(() => list.removeAt(index));
  }

  void _save() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    _formKey.currentState!.save();

    final result = widget.initial.copyWith(
      title: _title,
      category: _category,
      description: _description,
      imageUrl: _imageUrl.trim().isEmpty ? null : _imageUrl.trim(),
      ingredients: _ingredients,
      steps: _steps,
    );
    Navigator.of(context).pop<Recipe>(result);
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.isEditing ? 'Editar receita' : 'Nova receita';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(icon: const Icon(Icons.save), onPressed: _save),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              initialValue: _title,
              decoration: const InputDecoration(
                labelText: 'Título',
                prefixIcon: Icon(Icons.title),
              ),
              validator: (v) => v == null || v.trim().isEmpty ? 'Informe o título' : null,
              onSaved: (v) => _title = v!.trim(),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _category,
              items: _categories
                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                  .toList(),
              onChanged: (v) => setState(() => _category = v!),
              decoration: const InputDecoration(
                labelText: 'Categoria',
                prefixIcon: Icon(Icons.category_outlined),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              initialValue: _description,
              decoration: const InputDecoration(
                labelText: 'Descrição resumida',
                prefixIcon: Icon(Icons.short_text),
              ),
              validator: (v) => v == null || v.trim().isEmpty ? 'Informe a descrição' : null,
              onSaved: (v) => _description = v!.trim(),
            ),
            const SizedBox(height: 12),
            TextFormField(
              initialValue: _imageUrl,
              decoration: const InputDecoration(
                labelText: 'URL da imagem (opcional)',
                prefixIcon: Icon(Icons.image_outlined),
              ),
              onSaved: (v) => _imageUrl = v?.trim() ?? '',
            ),
            const SizedBox(height: 16),
            const Text('Ingredientes', style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _ingController,
                    decoration: const InputDecoration(hintText: 'Ex.: 2 xícaras de farinha'),
                    onSubmitted: (v) {
                      _addTo(_ingredients, v);
                      _ingController.clear();
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    _addTo(_ingredients, _ingController.text);
                    _ingController.clear();
                  },
                ),
              ],
            ),
            ...List.generate(_ingredients.length, (i) {
              final ing = _ingredients[i];
              return ListTile(
                title: Text(ing),
                trailing: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => _removeAt(_ingredients, i),
                ),
              );
            }),
            const Divider(),
            const Text('Modo de preparo', style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _stepController,
                    decoration: const InputDecoration(hintText: 'Ex.: Misture e leve ao forno...'),
                    onSubmitted: (v) {
                      _addTo(_steps, v);
                      _stepController.clear();
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    _addTo(_steps, _stepController.text);
                    _stepController.clear();
                  },
                ),
              ],
            ),
            ...List.generate(_steps.length, (i) {
              final step = _steps[i];
              return ListTile(
                leading: CircleAvatar(child: Text('${i + 1}')),
                title: Text(step),
                trailing: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => _removeAt(_steps, i),
                ),
              );
            }),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: _save,
              icon: const Icon(Icons.save),
              label: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}

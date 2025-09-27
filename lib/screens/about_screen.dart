import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  static const route = '/about';
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Sobre')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('App de Receitas Favoritas', style: style.headlineSmall),
            const SizedBox(height: 8),
            Text(
              'Exemplo educacional com navegação por abas no rodapé, '
                  'Cards com detalhes e Drawer com páginas gerais.',
              style: style.bodyLarge,
            ),
            const SizedBox(height: 12),
            Text(
              'Tecnologias: Flutter, Material Design, navegação por rotas e '
                  'componentes de lista (Cards).',
              style: style.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

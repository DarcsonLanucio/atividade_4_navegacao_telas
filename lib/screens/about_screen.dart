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
              'Exemplo educacional com abas (BottomNavigationBar), '
                  'Cards com ícone e descrição curta, tela de detalhes com imagem, ingredientes e preparo, '
                  'além de CRUD básico: inserir, editar e excluir com desfazer.',
              style: style.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}

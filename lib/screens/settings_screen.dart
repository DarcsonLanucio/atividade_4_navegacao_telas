import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  static const route = '/settings';
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Configurações')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Modo escuro'),
            subtitle: const Text('Demonstração visual (sem persistência)'),
            value: Theme.of(context).brightness == Brightness.dark,
            onChanged: (_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Tema: exemplo não alterna em runtime.')),
              );
            },
            secondary: Icon(Icons.dark_mode, color: cs.primary),
          ),
          ListTile(
            leading: Icon(Icons.lock_outline, color: cs.secondary),
            title: const Text('Privacidade'),
            subtitle: const Text('Política e permissões'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

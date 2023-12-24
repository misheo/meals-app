import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context)
                    .colorScheme
                    .onPrimaryContainer
                    .withOpacity(0.8)
              ]),
            ),
            padding: const EdgeInsets.all(20),
            child: const Row(
              children: [
                Text('hello world')
              ],
            ))
      ]),
    );
  }
}

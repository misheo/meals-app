import 'package:flutter/material.dart';
import 'package:rev_2024/screens/filters.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key ,required this.onSelectScreen});
  final void Function (String identifier) onSelectScreen ; 
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
                Icon(Icons.fastfood),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Cooking Up",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            )),
        ListTile(
          leading: const Icon(Icons.restaurant),
          title: const Text("Categories"),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.star),
          title: const Text("Favorites"),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text("Filtters"),
          onTap: () {
            
            Navigator.pop(context);
            onSelectScreen('filtters');
          },
        ),
      ]),
    );
  }
}

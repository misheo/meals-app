import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rev_2024/provider/favorite_provider.dart';
import 'package:rev_2024/provider/filters_provider.dart';
import 'package:rev_2024/screens/categories.dart';
import 'package:rev_2024/screens/filters.dart';
import 'package:rev_2024/screens/meals_screen.dart';
import 'package:rev_2024/widgets/main_drawer.dart';

class Tabs extends ConsumerStatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  ConsumerState<Tabs> createState() => _TabsState();
}

class _TabsState extends ConsumerState<Tabs> {
  int _selectedPageIndex = 0;

  void _selectedPage(index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void onSelectScreen(String identifier) {
    if (identifier == 'filtters') {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return const FiltersScreen();
        },
      ));
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final avilabelMeals = ref.watch(filteredMealsProvider);
    Widget activePage =  Categories(mealsList: avilabelMeals,);
    var activeTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      activePage =  MealsScreen(meals: ref.watch(favoriteProvider));
      activeTitle = 'Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activeTitle),
      ),
      drawer: MainDrawer(onSelectScreen: onSelectScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectedPage,
          currentIndex: _selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
          ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rev_2024/screens/categories.dart';
import 'package:rev_2024/screens/filters.dart';
import 'package:rev_2024/screens/meals_screen.dart';
import 'package:rev_2024/widgets/main_drawer.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _selectedPageIndex = 0;
  Map<Filter, bool> _selectedFilters = {
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  };

  void _selectedPage(index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void onSelectScreen(String identifier) async {
    if (identifier == 'filtters') {
      var selectedFiltersResult =
          await Navigator.push<Map<Filter, bool>>(context, MaterialPageRoute(
        builder: (context) {
          return const FiltersScreen();
        },
      ));
      setState(() {
        _selectedFilters = selectedFiltersResult ?? kInitialFilters;
      });
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const Categories();
    var activeTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      activePage = const MealsScreen(meals: []);
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

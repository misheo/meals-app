import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rev_2024/data/dummy_data.dart';
enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}
class FiltersNotifier extends StateNotifier<Map<Filter , bool>> {
  FiltersNotifier(): super({
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  });

  void setFilters(Map<Filter , bool> filterData) {
    state = filterData;
  }

  void setFilter(Filter filter , bool isActive) {
    state = {
      ...state,
      filter : isActive
    };
  }
  
}

final filtersProvider = StateNotifierProvider<FiltersNotifier , Map<Filter , bool>>((ref) {
  return FiltersNotifier();
}) ; 

final filteredMealsProvider = Provider((ref) {
  final selectedFilters= ref.watch(filtersProvider);
  return dummyMeals.where((element) {
    if (selectedFilters[Filter.glutenFree]! && !element.isGlutenFree) {
      return false;
    }
    if (selectedFilters[Filter.lactoseFree]! && !element.isLactoseFree) {
      
      return false;
    }
    if (selectedFilters[Filter.vegetarian]! && !element.isVegetarian) {
      return false;

    }
    if (selectedFilters[Filter.vegan]! && !element.isVegan) {
      return false;
    }
    return true ; 
  }).toList() ; 
});
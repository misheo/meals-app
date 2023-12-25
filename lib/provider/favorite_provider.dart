import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rev_2024/Modules/meal.dart';

class FavoriteNotifier extends StateNotifier<List<Meal>> {
  FavoriteNotifier() : super([]);
  bool handleFavorite(Meal meal) {
    if (state.contains(meal)) {
      state = state.where((element) => element.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true ; 
    }
  }
}
final favoriteProvider = StateNotifierProvider<FavoriteNotifier , List<Meal>>((ref) {
  return FavoriteNotifier();
});
import 'package:flutter/material.dart';
import 'package:rev_2024/Modules/meal.dart';
import 'package:rev_2024/screens/meal_details.dart';
import 'package:rev_2024/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({Key? key, required this.title, required this.meals})
      : super(key: key);
  final String title;
  final List<Meal> meals;
  void selectMeal (Meal meal , BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => MealDetails(meal: meal, )));
  }
  @override
  Widget build(BuildContext context) {
    
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return MealItem(meal: meals[index], onTab: (){
            selectMeal(meals[index], context);
          },);
        });
    if (meals.isEmpty) {
      content = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh ... nothing here',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Try different category',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      );
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: content);
  }
}

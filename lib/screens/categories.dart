import 'package:flutter/material.dart';
import 'package:rev_2024/Modules/category.dart';
import 'package:rev_2024/Modules/meal.dart';
import 'package:rev_2024/data/dummy_data.dart';
import 'package:rev_2024/screens/meals_screen.dart';
import '../widgets/category_item.dart';

class Categories extends StatefulWidget  {
  const Categories({Key? key , required this.mealsList}) : super(key: key);
  final List <Meal> mealsList ; 

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories>  {

    void onSelectCategory(Category category ) {
      final listOfMEals = widget.mealsList.where((element){
        return element.categories.contains(category.id);

      } ).toList() ; 
    Navigator.push(context, MaterialPageRoute(builder: (context) => MealsScreen(meals: listOfMEals, title: category.title,)));
  }

  @override
  Widget build(BuildContext context ) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int count = 2;
    double aspectRatio = 3 / 2;
    if (width > height) {
      aspectRatio = 5 / 3;
      count = 4; // 3 columns
    }
    return Scaffold(
        
        body: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: count,
                childAspectRatio: aspectRatio,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),

       
            children:  [
              ...availableCategories.map((e) => CategoryItem(category: e, selectCategory: () {
                onSelectCategory(e ) ; 

              },))
            ],
            ));
  }
}

import 'package:flutter/material.dart';
import 'package:rev_2024/Modules/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category , required this.selectCategory});
  final Category category;
  final void Function()  selectCategory ; 
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: selectCategory,
        splashFactory: Theme.of(context).splashFactory,
        splashColor: Theme.of(context).splashColor,
        borderRadius: BorderRadius.circular(16),
        
        child: Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                    colors: [category.color, category.color.withOpacity(0.8)])),
            child: Center(
              child: Text(
                category.title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            )));
  }
}

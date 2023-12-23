import 'package:flutter/material.dart';
import 'package:rev_2024/Modules/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        splashFactory: Theme.of(context).splashFactory,
        splashColor: Theme.of(context).splashColor,
        child: Container(
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
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

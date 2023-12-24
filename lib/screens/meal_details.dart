import 'package:flutter/material.dart';
import 'package:rev_2024/Modules/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({Key? key, required this.meal}) : super(key: key);
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.star_border))
          ],
        ),
        body: Column(
          children: [
            FadeInImage(
                image: NetworkImage(meal.imageUrl),
                placeholder: MemoryImage(kTransparentImage),
                fit: BoxFit.cover,
                height: 300,
                width: double.infinity),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(10),
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Ingredients :',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ...meal.ingredients.map((ingredient) => Text(ingredient)),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Steps :',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                    textAlign: TextAlign.center,
                  ) , 
                  const SizedBox(
                    height: 15,
                  ) , 
                  ...meal.steps.map((step) => Text(step))
                ],
              ),
            ),
          ],
        ));
  }
}

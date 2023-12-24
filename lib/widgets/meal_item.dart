import 'package:flutter/material.dart';
import 'package:rev_2024/Modules/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal , required this.onTab});
  final Meal meal;
  final void Function () onTab ;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      shadowColor: Theme.of(context).shadowColor,
      child: InkWell(
        onTap: onTab,
        borderRadius: BorderRadius.circular(16),
        splashColor: Theme.of(context).splashColor,
        splashFactory: Theme.of(context).splashFactory,
        child: Stack(
          children: [
            FadeInImage(
                image: NetworkImage(meal.imageUrl),
                placeholder: MemoryImage(kTransparentImage),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                  child: Column(children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.schedule,
                          color: Theme.of(context).colorScheme.onPrimary,
                          size: 17,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          '${meal.duration} min',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.work,
                          color: Theme.of(context).colorScheme.onPrimary,
                          size: 17,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          meal.complexity.name,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.attach_money,
                          color: Theme.of(context).colorScheme.onPrimary,
                          size: 17,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          meal.affordability.name,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                        ),
                      ],
                    )
                  ]),
                ))
          ],
        ),
      ),
    );
  }
}

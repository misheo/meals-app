import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rev_2024/Modules/meal.dart';
import 'package:rev_2024/provider/favorite_provider.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetails extends ConsumerWidget {
  const MealDetails({Key? key, required this.meal}) : super(key: key);
  final Meal meal;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;

    bool isFavorite = ref.watch(favoriteProvider).contains(meal);
    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
          actions: [
            IconButton(
                onPressed: () {
                  ref.watch(favoriteProvider.notifier).handleFavorite(meal);
                },
                icon: AnimatedSwitcher(
                    duration: const Duration(seconds: 1),
                    transitionBuilder: (child, animation) {
                      return ScaleTransition(scale: animation, child: child);
                    },
                    child: Icon(isFavorite ? Icons.star : Icons.star_border,
                        key: ValueKey(isFavorite)))),
          ],
        ),
        body: Column(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                  image: NetworkImage(meal.imageUrl),
                  placeholder: MemoryImage(kTransparentImage),
                  fit: BoxFit.cover,
                  height: 300,
                  width: double.infinity),
            ),
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
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ...meal.steps.map((step) => Text(step))
                ],
              ),
            ),
          ],
        ));
  }
}

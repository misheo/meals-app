import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rev_2024/provider/filters_provider.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    var selectedFilters = ref.read(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.pop(context);

      //     if (identifier == 'meals') {
      //       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      //         return const Tabs();
      //       })) ;
      //     }
      //   },
      // ),
      body: Column(
        children: [
          SwitchListTile(
            value: selectedFilters[Filter.glutenFree]!,
            onChanged: (value) {
              setState(() {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.glutenFree, value);
              });
            },
            title: Text(
              'Gluten-free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text('only add Gluten free meals',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: selectedFilters[Filter.lactoseFree]!,
            onChanged: (value) {
              setState(() {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.lactoseFree, value);
              });
            },
            title: Text(
              'Lactose-free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text('only add Lactose free meals',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: selectedFilters[Filter.vegetarian]!,
            onChanged: (value) {
              setState(() {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.vegetarian, value);
              });
            },
            title: Text(
              'Vegetarian Filer',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text('only add vegetarian meals',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: selectedFilters[Filter.vegan]!,
            onChanged: (value) {
              setState(() {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.vegan, value);
              });
            },
            title: Text(
              'Vegan Meals',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text('only add Vegan meals',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}

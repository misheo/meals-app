import 'package:flutter/material.dart';
import 'package:rev_2024/data/dummy_data.dart';
import '../widgets/category_item.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int count = 2;
    double aspectRatio = 3 / 2;
    if (width > height) {
      aspectRatio = 2 / 3;
      count = 3; // 3 columns
    }
    return Scaffold(
        
        body: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: count,
                childAspectRatio: aspectRatio,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),

            // itemBuilder: (context, index) {
            //   return const CategoryItem(
            //     color: Color.fromARGB(255, 255, 255, 255),
            //     name: 'test',
            //   );
            // }
            children:  [
              ...availableCategories.map((e) => CategoryItem(category: e,))
            ],
            ));
  }
}

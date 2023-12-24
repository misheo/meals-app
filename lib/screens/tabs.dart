import 'package:flutter/material.dart';
import 'package:rev_2024/Modules/category.dart';
import 'package:rev_2024/screens/categoeies.dart';
import 'package:rev_2024/screens/meals_screen.dart';
import 'package:rev_2024/widgets/main_drawer.dart';

class Tabs extends StatelessWidget {
  const Tabs({Key? key }) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Tab'),
      ),
      drawer: const MainDrawer() , 
      body:  Categories(  )
    );
  }
}


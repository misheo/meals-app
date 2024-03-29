import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rev_2024/screens/tabs.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 147, 229, 250),
  ),
  textTheme: GoogleFonts.robotoTextTheme(),
);
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Grocery',
      theme: theme,
      home: const Tabs(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pancake_swap_flutter/utils/theme.dart';
import 'package:pancake_swap_flutter/view/pair_choice_screen/pair_choice_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pancake Swap Flutter',
      theme: AppTheme.theme,
      home: const PairChoiceScreen(),
    );
  }
}

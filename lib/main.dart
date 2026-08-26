import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/features/main/view/main_screen.dart';
import 'package:rick_and_morty_app/core/theme/fonts/fonts.dart';

void main() {
  runApp(const RickAndMortyApp());
}

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: AppFonts.mainFont),
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

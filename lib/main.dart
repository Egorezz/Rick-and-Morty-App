import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/theme/fonts/fonts.dart';
import 'package:rick_and_morty_app/router/router.dart';

void main() {
  runApp(RickAndMortyApp());
}

class RickAndMortyApp extends StatelessWidget {
  RickAndMortyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: AppFonts.mainFont),
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}

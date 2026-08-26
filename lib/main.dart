import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/theme/fonts/fonts.dart';
import 'package:rick_and_morty_app/features/characters/presentation/bloc/character_bloc.dart';
import 'package:rick_and_morty_app/router/router.dart';

void main() {
  runApp(RickAndMortyApp());
}

class RickAndMortyApp extends StatelessWidget {
  RickAndMortyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharacterBloc(),
      child: MaterialApp.router(
        title: 'Rick and Morty App',
        theme: ThemeData(fontFamily: AppFonts.mainFont),
        routerConfig: _appRouter.config(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

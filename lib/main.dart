import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty_app/core/theme/fonts/fonts.dart';
import 'package:rick_and_morty_app/features/characters/data/datasources/character_remote_data_source.dart';
import 'package:rick_and_morty_app/features/characters/data/repositories/character_repository_impl.dart';
import 'package:rick_and_morty_app/features/characters/domain/repositories/character_repository.dart';
import 'package:rick_and_morty_app/features/characters/presentation/bloc/character_bloc/character_bloc.dart';
import 'package:rick_and_morty_app/router/router.dart';

void main() {
  final httpClient = http.Client();
  final remoteDataSource = CharacterRemoteDataSourceImpl(client: httpClient);
  final characterRepository = CharacterRepositoryImpl(
    remoteDataSource: remoteDataSource,
  );

  runApp(RickAndMortyApp(characterRepository: characterRepository));
}

class RickAndMortyApp extends StatelessWidget {
  final CharacterRepository characterRepository;

  RickAndMortyApp({super.key, required this.characterRepository});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: characterRepository,
      child: BlocProvider(
        create: (context) =>
            CharacterBloc(repository: characterRepository)
              ..add(FetchCharactersEvent()),
        child: MaterialApp.router(
          title: 'Rick and Morty App',
          theme: ThemeData(fontFamily: AppFonts.mainFont),
          routerConfig: _appRouter.config(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}

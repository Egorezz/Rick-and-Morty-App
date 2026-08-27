import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rick_and_morty_app/features/characters/data/datasources/character_local_data_source.dart';
import 'package:rick_and_morty_app/features/characters/data/datasources/character_remote_data_source.dart';
import 'package:rick_and_morty_app/features/characters/data/repositories/character_repository_impl.dart';
import 'package:rick_and_morty_app/features/characters/domain/repositories/character_repository.dart';
import 'package:rick_and_morty_app/features/characters/presentation/bloc/character_bloc/character_bloc.dart';
import 'package:rick_and_morty_app/features/characters/presentation/bloc/favorites_bloc/favorites_bloc.dart';
import 'package:rick_and_morty_app/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();

  final localDataSource = CharacterLocalDataSourceImpl(
    sharedPreferences: sharedPreferences,
  );

  final remoteDataSource = CharacterRemoteDataSourceImpl(client: http.Client());

  final characterRepository = CharacterRepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
  );

  runApp(MyApp(characterRepository: characterRepository));
}

class MyApp extends StatefulWidget {
  final CharacterRepository characterRepository;

  const MyApp({super.key, required this.characterRepository});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<CharacterRepository>.value(
      value: widget.characterRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                CharacterBloc(repository: widget.characterRepository),
          ),
          BlocProvider(
            create: (context) =>
                FavoritesBloc(repository: widget.characterRepository)
                  ..add(LoadFavoritesEvent()),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Rick and Morty',
          routerConfig: _appRouter.config(),
        ),
      ),
    );
  }
}

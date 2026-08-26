import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:rick_and_morty_app/core/theme/colors/colors.dart';
import 'package:rick_and_morty_app/core/theme/icons/icons.dart';
import 'package:rick_and_morty_app/features/characters/presentation/bloc/character_bloc.dart';
import 'package:rick_and_morty_app/features/characters/presentation/widgets/character_card.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    context.read<CharacterBloc>().add(FetchCharactersEvent());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<CharacterBloc>().add(FetchCharactersEvent());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.main,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: SvgPicture.asset(
            AppIcons.rickIcon,
            width: 40,
            height: 40,
            fit: BoxFit.contain,
          ),
        ),
        title: Text(
          'Rick and Morty App',
          style: TextStyle(
            color: AppColors.background,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SvgPicture.asset(
              AppIcons.mortyIcon,
              width: 40,
              height: 40,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
      body: BlocBuilder<CharacterBloc, CharacterState>(
        builder: (context, state) {
          if (state.status == CharacterStatus.loading &&
              state.characters.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.main),
            );
          }

          if (state.status == CharacterStatus.error &&
              state.characters.isEmpty) {
            return const Center(
              child: Text(
                'Не удалось загрузить данные',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: AppColors.background,
                ),
              ),
            );
          }

          return ListView.builder(
            controller: _scrollController,
            itemCount: state.hasReachedMax
                ? state.characters.length
                : state.characters.length + 1,
            itemBuilder: (context, index) {
              if (index >= state.characters.length) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(
                    child: CircularProgressIndicator(color: AppColors.main),
                  ),
                );
              }
              return CharacterCard(character: state.characters[index]);
            },
          );
        },
      ),
    );
  }
}

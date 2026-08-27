import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/theme/colors/colors.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/characters/presentation/bloc/favorites_bloc/favorites_bloc.dart';
import 'package:rick_and_morty_app/router/router.gr.dart';

@RoutePage()
class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.main,
        title: const Text(
          'Favourites',
          style: TextStyle(
            color: AppColors.background,
            fontWeight: FontWeight.bold,
            fontSize: 27,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
          if (state is FavoritesLoadingState) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.main),
            );
          }

          if (state is FavoritesErrorState) {
            return Center(
              child: Text(
                'Error: ${state.message}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          if (state is FavoritesLoadedState) {
            final favorites = state.favorites;

            if (favorites.isEmpty) {
              return const Center(
                child: Text(
                  'List of favorite characters is empty',
                  style: TextStyle(color: AppColors.mainText, fontSize: 16),
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final character = favorites[index];
                return _buildFavoriteCard(context, character);
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildFavoriteCard(BuildContext context, Character character) {
    return Card(
      color: AppColors.containerBackground,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: character.image,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
            placeholder: (context, url) => const SizedBox(
              width: 70,
              height: 70,
              child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
            ),
            errorWidget: (context, url, error) => const Icon(
              Icons.broken_image,
              size: 40,
              color: AppColors.unselectedIcon,
            ),
          ),
        ),
        title: Text(
          character.name,
          style: const TextStyle(
            color: AppColors.mainText,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          character.species,
          style: const TextStyle(color: AppColors.secondaryText),
        ),
        trailing: IconButton(
          iconSize: 40,
          icon: const Icon(Icons.favorite, color: AppColors.favourite),
          onPressed: () {
            context.read<FavoritesBloc>().add(ToggleFavoriteEvent(character));
          },
        ),
        onTap: () {
          context.router.push(CharacterDetailsRoute(character: character));
        },
      ),
    );
  }
}

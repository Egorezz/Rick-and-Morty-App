import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/theme/colors/colors.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/characters/domain/repositories/character_repository.dart';
import 'package:rick_and_morty_app/features/characters/presentation/bloc/character_details_bloc/character_details_bloc.dart';

@RoutePage()
class CharacterDetailsScreen extends StatefulWidget {
  final Character character;

  const CharacterDetailsScreen({super.key, required this.character});

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CharacterDetailsBloc(repository: context.read<CharacterRepository>())
            ..add(GetCharacterDetailsEvent(widget.character.id)),
      child: BlocBuilder<CharacterDetailsBloc, CharacterDetailsState>(
        builder: (context, state) {
          final character = (state is CharacterDetailsLoaded)
              ? state.character
              : widget.character;

          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.background,
                ),
                onPressed: () {
                  context.router.maybePop();
                },
              ),
              backgroundColor: AppColors.main,
              title: Text(
                character.name,
                style: TextStyle(
                  color: AppColors.background,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    icon: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder: (child, animation) =>
                          ScaleTransition(scale: animation, child: child),
                      child: Icon(
                        _isFavorite ? Icons.favorite : Icons.favorite_border,
                        key: ValueKey<bool>(_isFavorite),
                        color: _isFavorite
                            ? AppColors.favourite
                            : AppColors.background,
                        size: 37,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _isFavorite = !_isFavorite;
                      });
                    },
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                        imageUrl: character.image,
                        width: 400,
                        height: 400,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const SizedBox(
                          width: 400,
                          height: 400,
                          child: Center(child: CircularProgressIndicator()),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.broken_image, size: 100),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  if (state is CharacterDetailsLoading ||
                      state is CharacterDetailsInitial)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: CircularProgressIndicator(color: AppColors.main),
                    )
                  else if (state is CharacterDetailsError)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Error: ${state.message}',
                        style: const TextStyle(color: Colors.red),
                      ),
                    )
                  else
                    _buildInfoContainer(character),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoContainer(Character character) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.containerBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.mainText,
              ),
            ),
          ),
          const Divider(color: AppColors.main),
          const SizedBox(height: 8),
          Text(
            'Character ID: #${character.id}',
            style: TextStyle(color: AppColors.secondaryText, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            'Name: ${character.name}',
            style: TextStyle(
              color: AppColors.mainText,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                'Status: ${character.status}',
                style: TextStyle(color: AppColors.secondaryText, fontSize: 16),
              ),
              const SizedBox(width: 8),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: character.status == 'Alive'
                      ? AppColors.main
                      : AppColors.unselectedIcon,
                ),
              ),
            ],
          ),
          if (character.species.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              'Species: ${character.species}',
              style: TextStyle(color: AppColors.secondaryText, fontSize: 16),
            ),
          ],
          if (character.gender.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              'Gender: ${character.gender}',
              style: TextStyle(color: AppColors.secondaryText, fontSize: 16),
            ),
          ],
          if (character.originName.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              'Origin: ${character.originName}',
              style: TextStyle(color: AppColors.secondaryText, fontSize: 16),
            ),
          ],
          if (character.locationName.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              'Last location: ${character.locationName}',
              style: TextStyle(color: AppColors.secondaryText, fontSize: 16),
            ),
          ],
        ],
      ),
    );
  }
}

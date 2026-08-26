import 'package:rick_and_morty_app/core/theme/colors/colors.dart';
import 'package:rick_and_morty_app/core/theme/icons/icons.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/widgets/list_card.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
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
        centerTitle: true,
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
        backgroundColor: AppColors.main,
      ),
      body: ListView(
        children: [
          ListCard(
            imageUrl: 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
            title: 'Rick Sanchez',
            description: 'A genius scientist and alcoholic.',
          ),
          ListCard(
            imageUrl: 'https://rickandmortyapi.com/api/character/avatar/2.jpeg',
            title: 'Morty Smith',
            description: 'A shy and insecure teenager.',
          ),
        ],
      ),
    );
  }
}

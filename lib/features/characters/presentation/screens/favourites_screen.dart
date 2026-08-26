import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';


@RoutePage()
class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Favourites Screen'),
      ),
    );
  }
}
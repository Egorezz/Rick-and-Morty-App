part of 'character_details_bloc.dart';

sealed class CharacterDetailsState {}

class CharacterDetailsInitial extends CharacterDetailsState {}

class CharacterDetailsLoading extends CharacterDetailsState {}

class CharacterDetailsLoaded extends CharacterDetailsState {
  final Character character;
  CharacterDetailsLoaded(this.character);
}

class CharacterDetailsError extends CharacterDetailsState {
  final String message;
  CharacterDetailsError(this.message);
}

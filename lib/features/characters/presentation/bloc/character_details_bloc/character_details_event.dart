part of 'character_details_bloc.dart';

sealed class CharacterDetailsEvent {}

class GetCharacterDetailsEvent extends CharacterDetailsEvent {
  final int id;
  GetCharacterDetailsEvent(this.id);
}

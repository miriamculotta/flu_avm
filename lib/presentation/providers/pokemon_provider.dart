import 'package:flu_avm/config/entities/pokemon.dart';
import 'package:flu_avm/services/pokemon_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pokemonProvider = FutureProvider.family<Pokemon, String>((ref, id) async {
  final (pokemon, error) = await PokemonServices.getPokemon(id);

  if (pokemon != null) return pokemon;

  throw Exception(error);
});

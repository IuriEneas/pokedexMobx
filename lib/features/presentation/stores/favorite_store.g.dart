// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoriteStore on _FavoriteStore, Store {
  late final _$pokemonAtom =
      Atom(name: '_FavoriteStore.pokemon', context: context);

  @override
  List<PokemonEntity> get pokemon {
    _$pokemonAtom.reportRead();
    return super.pokemon;
  }

  @override
  set pokemon(List<PokemonEntity> value) {
    _$pokemonAtom.reportWrite(value, super.pokemon, () {
      super.pokemon = value;
    });
  }

  late final _$_FavoriteStoreActionController =
      ActionController(name: '_FavoriteStore', context: context);

  @override
  void removePokemon(int id) {
    final _$actionInfo = _$_FavoriteStoreActionController.startAction(
        name: '_FavoriteStore.removePokemon');
    try {
      return super.removePokemon(id);
    } finally {
      _$_FavoriteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchPokemon() {
    final _$actionInfo = _$_FavoriteStoreActionController.startAction(
        name: '_FavoriteStore.fetchPokemon');
    try {
      return super.fetchPokemon();
    } finally {
      _$_FavoriteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemon: ${pokemon}
    ''';
  }
}

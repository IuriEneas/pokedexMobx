import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_mobx/features/presentation/pages/detail/pokemon_detail_page.dart';
import 'package:pokedex_mobx/features/presentation/stores/favorite_store.dart';
import 'package:pokedex_mobx/injection_container.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage({
    super.key,
  });

  final FavoriteStore favoriteStore = getIt<FavoriteStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          favoriteStore.fetchPokemon();

          if (favoriteStore.pokemon.isEmpty) {
            return const Center(
              child: Text('Não há Pokemon salvos!'),
            );
          }
          return CarouselSlider(
            items: favoriteStore.pokemon.map((item) {
              return PokemonDetailPage(
                pokemon: item,
                isSmall: true,
                favorite: () {
                  favoriteStore.removePokemon(item.id!);
                },
              );
            }).toList(),
            options: CarouselOptions(
              padEnds: true,
              enableInfiniteScroll: false,
              height: MediaQuery.of(context).size.height,
            ),
          );
        },
      ),
    );
  }
}

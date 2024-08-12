import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/util/string_util.dart';
import 'package:flutter_application_1/core/util/util.dart';
import 'package:flutter_application_1/features/auth/domain/entities/pokemon.dart';
import 'package:flutter_application_1/features/auth/presentation/widgets/type_tile.dart';

class PokemonDetailPage extends StatelessWidget {
  const PokemonDetailPage({
    super.key,
    required this.pokemon,
    this.isSmall = false,
    this.favorite,
  });

  final PokemonEntity pokemon;
  final bool isSmall;
  final void Function()? favorite;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final pokemonColor = Util.getPokemonTypeColor(pokemon.types[0].type!);
    final pokemonSecondaryColor = pokemon.types.length > 1
        ? Util.getPokemonTypeColor(pokemon.types[1].type!)
        : Colors.white.withAlpha(110);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        StringUtil.formatId(pokemon.id!),
                        style: TextStyle(
                          fontSize: 22,
                          color: pokemonColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        StringUtil.formatName(pokemon.name!),
                        style: TextStyle(
                          fontSize: isSmall ? 23 : 28,
                          color: pokemonColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 70),
                      IconButton(
                        onPressed: favorite,
                        icon: const Icon(Icons.favorite_outline),
                      ),
                      const Text(
                        'Peso',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 99, 99, 99),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${pokemon.weight! / 10} Kg',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 99, 99, 99),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Altura',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 99, 99, 99),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${pokemon.height! / 10} metros',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 99, 99, 99),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TypeTileWidget(
                            type: pokemon.types[0].type!.name!,
                            color: pokemonColor,
                            isSmall: isSmall,
                          ),
                          const SizedBox(width: 8),
                          pokemon.types.length > 1
                              ? TypeTileWidget(
                                  type: pokemon.types[1].type!.name!,
                                  color: pokemonSecondaryColor,
                                  isSmall: isSmall,
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ],
                  ),
                ),
                _pokemonImage(
                  pokemonColor,
                  pokemonSecondaryColor,
                  size.width,
                  size,
                )
              ],
            ),
          ),
          _statsContainer(size),
        ],
      ),
    );
  }

  _statsContainer(Size size) {
    return Expanded(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: pokemon.stats.length,
        itemBuilder: (context, index) {
          var pokemonStat = pokemon.stats[index];
          return statsWidget(
            pokemonStat.stat!.name!,
            pokemonStat.baseStat!,
            size,
          );
        },
      ),
    );
  }

  _pokemonImage(Color primary, Color secondary, double radius, Size size) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius),
              bottomLeft: Radius.circular(radius),
            ),
            color: primary,
          ),
          child: Container(
            margin: const EdgeInsets.fromLTRB(40, 40, 0, 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius),
                bottomLeft: Radius.circular(radius),
              ),
              color: secondary,
            ),
            width: !isSmall ? size.width * 0.4 : size.width * 0.28,
            height: !isSmall ? size.height * 0.35 : size.height * 0.25,
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          right: 0,
          child: Hero(
            tag: pokemon.id.toString(),
            child: Image(
              width: !isSmall ? size.width * 0.5 : size.width * 0.4,
              alignment: Alignment.centerRight,
              image: NetworkImage(
                pokemon.sprites!.other?.officialArtwork?.frontDefault ?? '',
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget statsWidget(String statName, int value, Size size) {
  double margin = 10;

  return Container(
    margin: EdgeInsets.symmetric(horizontal: margin, vertical: margin / 1.2),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '${Util.getPokemonStat(statName)}:',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 99, 99, 99),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              '$value',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 99, 99, 99),
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 210, 210, 210),
            borderRadius: BorderRadius.circular(8),
          ),
          width: size.width,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [_progressBar(value, size, margin)],
          ),
        ),
      ],
    ),
  );
}

_progressBar(int value, Size size, double margin) {
  var maxValue = 200;
  double percent = (size.width * value) / maxValue;

  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: _progressBarColor(value),
    ),
    height: 20,
    width:
        percent > size.width ? size.width - margin * 2 : percent - margin * 2,
    child: Container(
      margin: const EdgeInsets.only(
        top: 2,
        left: 2,
        right: 2,
        bottom: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white.withAlpha(60),
      ),
    ),
  );
}

Color _progressBarColor(int value) {
  if (value <= 36) {
    return Colors.red;
  } else if (value <= 72) {
    return Colors.orange;
  } else if (value <= 108) {
    return Colors.amber;
  } else if (value <= 180) {
    return Colors.lightGreen;
  } else if (value <= 216) {
    return Colors.green;
  } else {
    return Colors.blue[800] as Color;
  }
}

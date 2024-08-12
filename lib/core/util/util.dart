import 'package:flutter/material.dart';
import 'package:pokedex_mobx/features/auth/domain/entities/pokemon.dart';

abstract class Util {
  static Color getPokemonTypeColor(VersionClassEntity? type) {
    switch (type?.name) {
      case 'normal':
        return const Color.fromARGB(255, 216, 152, 152);
      case 'fire':
        return Colors.red;
      case 'water':
        return Colors.blue;
      case 'electric':
        return Colors.yellow;
      case 'grass':
        return Colors.green;
      case 'ice':
        return Colors.cyan;
      case 'fighting':
        return Colors.brown;
      case 'poison':
        return Colors.purple;
      case 'ground':
        return Colors.orange;
      case 'flying':
        return const Color.fromARGB(255, 132, 132, 245);
      case 'psychic':
        return Colors.pink;
      case 'bug':
        return Colors.lightGreen;
      case 'rock':
        return Colors.brown.shade800;
      case 'ghost':
        return Colors.deepPurple;
      case 'dragon':
        return Colors.indigo;
      case 'dark':
        return const Color.fromARGB(255, 94, 94, 94);
      case 'steel':
        return Colors.blueGrey;
      case 'fairy':
        return const Color.fromARGB(255, 236, 132, 166);
      default:
        return Colors.white
            .withAlpha(110); // Cor padrão para tipos desconhecidos
    }
  }

  static String getPokemonStat(String statName) {
    switch (statName) {
      case 'attack':
        return 'Ataque';
      case 'hp':
        return 'HP';
      case 'defense':
        return 'Defesa';
      case 'special-attack':
        return 'Ataque especial';
      case 'special-defense':
        return 'Defesa especial';
      case 'speed':
        return 'Velocidade';
      default:
        return statName;
    }
  }
}

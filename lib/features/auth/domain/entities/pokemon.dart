import 'package:equatable/equatable.dart';

class PokemonEntity extends Equatable {
  const PokemonEntity({
    required this.abilities,
    required this.baseExperience,
    required this.gameIndices,
    required this.height,
    required this.id,
    required this.isDefault,
    required this.locationAreaEncounters,
    required this.moves,
    required this.name,
    required this.order,
    required this.sprites,
    required this.stats,
    required this.types,
    required this.weight,
  });

  final List<AbilityElementEntity> abilities;
  final int? baseExperience;
  final List<GameIndexEntity> gameIndices;
  final int? height;
  final int? id;
  final bool? isDefault;
  final String? locationAreaEncounters;
  final List<MoveEntity> moves;
  final String? name;
  final int? order;
  final SpritesEntity? sprites;
  final List<StatEntity> stats;
  final List<TypeEntity> types;
  final int? weight;

  Map<String, dynamic> toJson() => {
        "abilities": abilities.map((e) => e.toJson()).toList(),
        "base_experience": baseExperience,
        "game_indices": gameIndices.map((e) => e.toJson()).toList(),
        "height": height,
        "id": id,
        "is_default": isDefault,
        "location_area_encounters": locationAreaEncounters,
        "moves": moves.map((e) => e.toJson()).toList(),
        "name": name,
        "order": order,
        "sprites": sprites?.toJson(),
        "stats": stats.map((e) => e.toJson()).toList(),
        "types": types.map((e) => e.toJson()).toList(),
        "weight": weight,
      };

  @override
  List<Object?> get props => [id, name];
}

class AbilityElementEntity extends Equatable {
  const AbilityElementEntity({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  final AbilityEntity? ability;
  final bool? isHidden;
  final int? slot;

  Map<String, dynamic> toJson() => {
        "ability": ability?.toJson(),
        "is_hidden": isHidden,
        "slot": slot,
      };

  @override
  List<Object?> get props => throw UnimplementedError();
}

class AbilityEntity extends Equatable {
  const AbilityEntity({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };

  @override
  List<Object?> get props => throw UnimplementedError();
}

class VersionClassEntity extends Equatable {
  const VersionClassEntity({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };

  @override
  List<Object?> get props => throw UnimplementedError();
}

class GameIndexEntity extends Equatable {
  const GameIndexEntity({
    required this.gameIndex,
    required this.version,
  });

  final int? gameIndex;
  final VersionClassEntity? version;

  Map<String, dynamic> toJson() => {
        "game_index": gameIndex,
        "version": version?.toJson(),
      };

  @override
  List<Object?> get props => throw UnimplementedError();
}

class MoveEntity extends Equatable {
  const MoveEntity({
    required this.move,
  });

  final VersionClassEntity? move;

  Map<String, dynamic> toJson() => {
        "move": move?.toJson(),
      };

  @override
  List<Object?> get props => throw UnimplementedError();
}

class SpritesEntity extends Equatable {
  const SpritesEntity({
    required this.backDefault,
    required this.backShiny,
    required this.frontDefault,
    required this.frontShiny,
    required this.other,
  });

  final String? backDefault;
  final String? backShiny;
  final String? frontDefault;
  final String? frontShiny;
  final OtherEntity? other;

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_shiny": backShiny,
        "front_default": frontDefault,
        "front_shiny": frontShiny,
        "other": other?.toJson(),
      };

  @override
  List<Object?> get props => throw UnimplementedError();
}

class OtherEntity extends Equatable {
  const OtherEntity({
    required this.officialArtwork,
  });

  final OfficialArtworkEntity? officialArtwork;

  Map<String, dynamic> toJson() => {
        "official-artwork": officialArtwork?.toJson(),
      };

  @override
  List<Object?> get props => throw UnimplementedError();
}

class OfficialArtworkEntity extends Equatable {
  const OfficialArtworkEntity({
    required this.frontDefault,
    required this.frontShiny,
  });

  final String? frontDefault;
  final String? frontShiny;

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_shiny": frontShiny,
      };

  @override
  List<Object?> get props => throw UnimplementedError();
}

class StatEntity extends Equatable {
  const StatEntity({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  final int? baseStat;
  final int? effort;
  final VersionClassEntity? stat;

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat?.toJson(),
      };

  @override
  List<Object?> get props => throw UnimplementedError();
}

class TypeEntity extends Equatable {
  const TypeEntity({
    required this.slot,
    required this.type,
  });

  final int? slot;
  final VersionClassEntity? type;

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type?.toJson(),
      };

  @override
  List<Object?> get props => throw UnimplementedError();
}

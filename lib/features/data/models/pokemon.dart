import 'package:pokedex_mobx/features/domain/entities/pokemon.dart';

class PokemonModel extends PokemonEntity {
  const PokemonModel({
    required super.abilities,
    required super.baseExperience,
    required super.gameIndices,
    required super.height,
    required super.id,
    required super.isDefault,
    required super.locationAreaEncounters,
    required super.moves,
    required super.name,
    required super.order,
    required super.sprites,
    required super.stats,
    required super.types,
    required super.weight,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      abilities: json["abilities"] == null
          ? []
          : List<AbilityElementModel>.from(
              json["abilities"]!.map(
                (x) => AbilityElementModel.fromJson(x),
              ),
            ),
      baseExperience: json["base_experience"],
      gameIndices: json["game_indices"] == null
          ? []
          : List<GameIndexModel>.from(
              json["game_indices"]!.map((x) => GameIndexModel.fromJson(x))),
      height: json["height"],
      id: json["id"],
      isDefault: json["is_default"],
      locationAreaEncounters: json["location_area_encounters"],
      moves: json["moves"] == null
          ? []
          : List<MoveModel>.from(
              json["moves"]!.map((x) => MoveModel.fromJson(x))),
      name: json["name"],
      order: json["order"],
      sprites: json["sprites"] == null
          ? null
          : SpritesModel.fromJson(json["sprites"]),
      stats: json["stats"] == null
          ? []
          : List<StatModel>.from(
              json["stats"]!.map((x) => StatModel.fromJson(x))),
      types: json["types"] == null
          ? []
          : List<TypeModel>.from(
              json["types"]!.map((x) => TypeModel.fromJson(x))),
      weight: json["weight"],
    );
  }
}

class AbilityElementModel extends AbilityElementEntity {
  const AbilityElementModel({
    required super.ability,
    required super.isHidden,
    required super.slot,
  });

  factory AbilityElementModel.fromJson(Map<String, dynamic> json) {
    return AbilityElementModel(
      ability: AbilityModel.fromJson(json["ability"]),
      isHidden: json["is_hidden"],
      slot: json["slot"],
    );
  }
}

class AbilityModel extends AbilityEntity {
  const AbilityModel({
    required super.name,
    required super.url,
  });

  factory AbilityModel.fromJson(Map<String, dynamic> json) {
    return AbilityModel(
      name: json["name"],
      url: json["url"],
    );
  }
}

class VersionClassModel extends VersionClassEntity {
  const VersionClassModel({
    required super.name,
    required super.url,
  });

  factory VersionClassModel.fromJson(Map<String, dynamic> json) {
    return VersionClassModel(
      name: json["name"],
      url: json["url"],
    );
  }
}

class GameIndexModel extends GameIndexEntity {
  const GameIndexModel({
    required super.gameIndex,
    required super.version,
  });

  factory GameIndexModel.fromJson(Map<String, dynamic> json) {
    return GameIndexModel(
      gameIndex: json["game_index"],
      version: VersionClassModel.fromJson(json["version"]),
    );
  }
}

class MoveModel extends MoveEntity {
  const MoveModel({
    required super.move,
  });

  factory MoveModel.fromJson(Map<String, dynamic> json) {
    return MoveModel(
      move: VersionClassModel.fromJson(json["move"]),
    );
  }
}

class SpritesModel extends SpritesEntity {
  const SpritesModel({
    required super.backDefault,
    required super.backShiny,
    required super.frontDefault,
    required super.frontShiny,
    required super.other,
  });

  factory SpritesModel.fromJson(Map<String, dynamic> json) {
    return SpritesModel(
      backDefault: json["back_default"],
      backShiny: json["back_shiny"],
      frontDefault: json["front_default"],
      frontShiny: json["front_shiny"],
      other: OtherModel.fromJson(json["other"]),
    );
  }
}

class OtherModel extends OtherEntity {
  const OtherModel({
    required super.officialArtwork,
  });

  factory OtherModel.fromJson(Map<String, dynamic> json) {
    return OtherModel(
      officialArtwork: OfficialArtworkModel.fromJson(json["official-artwork"]),
    );
  }
}

class OfficialArtworkModel extends OfficialArtworkEntity {
  const OfficialArtworkModel({
    required super.frontDefault,
    required super.frontShiny,
  });

  factory OfficialArtworkModel.fromJson(Map<String, dynamic> json) {
    return OfficialArtworkModel(
      frontDefault: json["front_default"],
      frontShiny: json["front_shiny"],
    );
  }
}

class StatModel extends StatEntity {
  const StatModel({
    required super.baseStat,
    required super.effort,
    required super.stat,
  });

  factory StatModel.fromJson(Map<String, dynamic> json) {
    return StatModel(
      baseStat: json["base_stat"],
      effort: json["effort"],
      stat: VersionClassModel.fromJson(json["stat"]),
    );
  }
}

class TypeModel extends TypeEntity {
  const TypeModel({
    required super.slot,
    required super.type,
  });

  factory TypeModel.fromJson(Map<String, dynamic> json) {
    return TypeModel(
      slot: json["slot"],
      type: VersionClassModel.fromJson(json["type"]),
    );
  }
}

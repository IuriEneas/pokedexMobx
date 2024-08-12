import 'package:pokedex_mobx/features/domain/entities/result.dart';

class ResultModel extends ResultEntity {
  const ResultModel({
    required super.count,
    required super.next,
    required super.previous,
    required super.results,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      count: json["count"] ?? 0,
      next: json["next"] ?? "",
      previous: json["previous"] ?? "",
      results: json["results"] == null
          ? []
          : List<PokemonResultModel>.from(
              json["results"]!.map(
                (x) => PokemonResultModel.fromJson(x),
              ),
            ),
    );
  }
}

class PokemonResultModel extends PokemonResultEntity {
  const PokemonResultModel({
    required super.name,
    required super.url,
  });

  factory PokemonResultModel.fromJson(Map<String, dynamic> json) {
    return PokemonResultModel(
      name: json["name"] ?? "",
      url: json["url"] ?? "",
    );
  }
}

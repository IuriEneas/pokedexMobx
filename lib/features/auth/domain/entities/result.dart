import 'package:equatable/equatable.dart';

class ResultEntity extends Equatable {
  const ResultEntity({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  final int? count;
  final String? next;
  final String? previous;
  final List<PokemonResultEntity>? results;

  Map<String, dynamic> toJson() => {
        "results": results?.map((e) => e.toJson()).toList(),
        "next": next,
        "previous": previous,
        "count": count,
      };

  @override
  List<Object?> get props => [next, previous];
}

class PokemonResultEntity extends Equatable {
  const PokemonResultEntity({
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

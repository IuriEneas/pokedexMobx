import 'package:flutter/material.dart';
import 'package:pokedex_mobx/core/util/string_util.dart';
import 'package:pokedex_mobx/features/domain/entities/pokemon.dart';

class PokemonTile extends StatefulWidget {
  const PokemonTile({
    super.key,
    required this.onTap,
    required this.onFavorite,
    required this.pokemon,
  });

  final void Function() onTap;
  final void Function() onFavorite;
  final PokemonEntity pokemon;

  @override
  State<PokemonTile> createState() => _PokemonTileState();
}

class _PokemonTileState extends State<PokemonTile>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    AnimationController controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    Animation<double> scaleAnimation =
        Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );

    Animation<Color?> colorAnimation =
        ColorTween(begin: Colors.white, end: Colors.red).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      }
    });

    final officialImage =
        widget.pokemon.sprites?.other?.officialArtwork?.frontDefault;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: const Color.fromARGB(207, 255, 118, 21),
      child: InkWell(
        highlightColor: const Color.fromARGB(51, 0, 0, 0),
        borderRadius: BorderRadius.circular(15),
        onTap: widget.onTap,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Hero(
                    tag: widget.pokemon.id.toString(),
                    child: Image(
                      fit: BoxFit.fill,
                      image: officialImage == null
                          ? const AssetImage('assets/ditto.png')
                          : NetworkImage(officialImage),
                      height: 60,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringUtil.formatName(widget.pokemon.name!),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(110, 0, 0, 0),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              widget.pokemon.types[0].type?.name ?? '',
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(90, 0, 0, 0),
                              ),
                            ),
                            const SizedBox(width: 5),
                            widget.pokemon.types.length > 1
                                ? Text(
                                    widget.pokemon.types[1].type?.name ?? '',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(90, 0, 0, 0),
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      StringUtil.formatId(widget.pokemon.id!),
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(90, 0, 0, 0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              right: 10,
              top: 10,
              child: IconButton(
                onPressed: () {
                  controller.forward();
                  widget.onFavorite();
                },
                icon: AnimatedBuilder(
                  animation: controller,
                  builder: (context, s) {
                    return Transform.scale(
                      scale: scaleAnimation.value,
                      child: Icon(
                        Icons.favorite,
                        color: colorAnimation.value,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

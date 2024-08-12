import 'package:flutter/material.dart';
import 'package:pokedex_mobx/features/presentation/pages/detail/pokemon_detail_page.dart';
import 'package:pokedex_mobx/features/presentation/pages/favorites/favorites_page.dart';
import 'package:pokedex_mobx/features/presentation/stores/home_store.dart';
import 'package:pokedex_mobx/features/presentation/widgets/lens_widget.dart';
import 'package:pokedex_mobx/features/presentation/widgets/pokemon_tile.dart';
import 'package:pokedex_mobx/injection_container.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeStore homeStore = getIt();
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    homeStore.fToast.init(context);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _buildBody(context),
        ),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return Center(
      child: Observer(
        builder: (_) {
          if (homeStore.isLoading) {
            return const CircularProgressIndicator();
          }

          if (homeStore.errorMessage != null) {
            return Text(homeStore.errorMessage!);
          }

          if (homeStore.isCompleted) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FavoritesPage(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.bookmark,
                        size: 33,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Pokedéx',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 233, 195, 4),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Observer(
                      builder: (_) {
                        return LensWidget(
                          percent: homeStore.batteryLevel,
                          onTap: homeStore.getBatteryLevel,
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Observer(
                  builder: (_) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CustomTextField(
                        controller: searchController,
                        prefix: const Icon(Icons.search),
                        suffix: homeStore.searchText.isNotEmpty
                            ? IconButton(
                                onPressed: () {
                                  homeStore.clearText();
                                  searchController.clear();
                                },
                                icon: const Icon(Icons.clear),
                              )
                            : const SizedBox(),
                        hint: 'Busque aqui',
                        onChanged: homeStore.searchPokemon,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 4 / 3,
                    ),
                    itemCount: homeStore.searchText.isEmpty
                        ? homeStore.pokemonList.length
                        : homeStore.searchPokemonList.length,
                    itemBuilder: (context, index) {
                      var pokemon = homeStore.searchText.isEmpty
                          ? homeStore.pokemonList[index]
                          : homeStore.searchPokemonList[index];
                      return PokemonTile(
                        onFavorite: () {
                          homeStore.setPokemonFavorite(pokemon);
                          if (homeStore.canAddPokemon) {
                            homeStore.showToast(
                              msg: 'Pokemon salvo em favoritos!',
                            );
                          } else {
                            homeStore.showToast(
                              msg: 'Este Pokemon já está salvo!',
                              color: Colors.yellowAccent,
                              icon: Icons.warning,
                            );
                          }
                        },
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PokemonDetailPage(
                                pokemon: pokemon,
                                favorite: () {
                                  homeStore.setCanAdd(pokemon);

                                  if (homeStore.canAddPokemon) {
                                    homeStore.setPokemonFavorite(pokemon);
                                  } else {
                                    Fluttertoast.showToast(
                                      msg: "This is a Toast message!",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      backgroundColor: Colors.black,
                                      textColor: Colors.white,
                                      fontSize: 16.0,
                                    );
                                  }
                                },
                              ),
                            ),
                          );
                        },
                        pokemon: pokemon,
                      );
                    },
                  ),
                ),
              ],
            );
          }

          return SizedBox(
            height: 40,
            child: ElevatedButton(
              onPressed: homeStore.onGetPokemonResult,
              child: const Text("Get data"),
            ),
          );
        },
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.obscure = false,
    this.enabled = true,
    this.textInputType = TextInputType.name,
    this.onChanged,
    required this.hint,
    this.suffix,
    this.prefix,
    this.onSubmit,
  });

  final TextEditingController controller;
  final bool obscure;
  final bool enabled;
  final TextInputType textInputType;
  final Function(String)? onChanged;
  final Function(String)? onSubmit;
  final String hint;
  final Widget? suffix;
  final Widget? prefix;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(32),
      ),
      padding: prefix != null ? null : const EdgeInsets.only(left: 16),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        keyboardType: textInputType,
        onChanged: onChanged,
        onSubmitted: onSubmit,
        enabled: enabled,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          prefixIcon: prefix,
          suffixIcon: suffix,
        ),
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}

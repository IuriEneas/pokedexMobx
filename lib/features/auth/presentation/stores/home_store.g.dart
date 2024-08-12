// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  late final _$pokemonResultListAtom =
      Atom(name: '_HomeStore.pokemonResultList', context: context);

  @override
  List<PokemonResultEntity> get pokemonResultList {
    _$pokemonResultListAtom.reportRead();
    return super.pokemonResultList;
  }

  @override
  set pokemonResultList(List<PokemonResultEntity> value) {
    _$pokemonResultListAtom.reportWrite(value, super.pokemonResultList, () {
      super.pokemonResultList = value;
    });
  }

  late final _$pokemonListAtom =
      Atom(name: '_HomeStore.pokemonList', context: context);

  @override
  List<PokemonEntity> get pokemonList {
    _$pokemonListAtom.reportRead();
    return super.pokemonList;
  }

  @override
  set pokemonList(List<PokemonEntity> value) {
    _$pokemonListAtom.reportWrite(value, super.pokemonList, () {
      super.pokemonList = value;
    });
  }

  late final _$favoritePokemonListAtom =
      Atom(name: '_HomeStore.favoritePokemonList', context: context);

  @override
  List<PokemonEntity> get favoritePokemonList {
    _$favoritePokemonListAtom.reportRead();
    return super.favoritePokemonList;
  }

  @override
  set favoritePokemonList(List<PokemonEntity> value) {
    _$favoritePokemonListAtom.reportWrite(value, super.favoritePokemonList, () {
      super.favoritePokemonList = value;
    });
  }

  late final _$searchPokemonListAtom =
      Atom(name: '_HomeStore.searchPokemonList', context: context);

  @override
  List<PokemonEntity> get searchPokemonList {
    _$searchPokemonListAtom.reportRead();
    return super.searchPokemonList;
  }

  @override
  set searchPokemonList(List<PokemonEntity> value) {
    _$searchPokemonListAtom.reportWrite(value, super.searchPokemonList, () {
      super.searchPokemonList = value;
    });
  }

  late final _$resultAtom = Atom(name: '_HomeStore.result', context: context);

  @override
  ResultEntity? get result {
    _$resultAtom.reportRead();
    return super.result;
  }

  @override
  set result(ResultEntity? value) {
    _$resultAtom.reportWrite(value, super.result, () {
      super.result = value;
    });
  }

  late final _$currentPokemonNameAtom =
      Atom(name: '_HomeStore.currentPokemonName', context: context);

  @override
  String get currentPokemonName {
    _$currentPokemonNameAtom.reportRead();
    return super.currentPokemonName;
  }

  @override
  set currentPokemonName(String value) {
    _$currentPokemonNameAtom.reportWrite(value, super.currentPokemonName, () {
      super.currentPokemonName = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_HomeStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$batteryLevelAtom =
      Atom(name: '_HomeStore.batteryLevel', context: context);

  @override
  int get batteryLevel {
    _$batteryLevelAtom.reportRead();
    return super.batteryLevel;
  }

  bool _batteryLevelIsInitialized = false;

  @override
  set batteryLevel(int value) {
    _$batteryLevelAtom.reportWrite(
        value, _batteryLevelIsInitialized ? super.batteryLevel : null, () {
      super.batteryLevel = value;
      _batteryLevelIsInitialized = true;
    });
  }

  late final _$isCompletedAtom =
      Atom(name: '_HomeStore.isCompleted', context: context);

  @override
  bool get isCompleted {
    _$isCompletedAtom.reportRead();
    return super.isCompleted;
  }

  @override
  set isCompleted(bool value) {
    _$isCompletedAtom.reportWrite(value, super.isCompleted, () {
      super.isCompleted = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_HomeStore.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$searchTextAtom =
      Atom(name: '_HomeStore.searchText', context: context);

  @override
  String get searchText {
    _$searchTextAtom.reportRead();
    return super.searchText;
  }

  @override
  set searchText(String value) {
    _$searchTextAtom.reportWrite(value, super.searchText, () {
      super.searchText = value;
    });
  }

  late final _$offsetAtom = Atom(name: '_HomeStore.offset', context: context);

  @override
  String get offset {
    _$offsetAtom.reportRead();
    return super.offset;
  }

  @override
  set offset(String value) {
    _$offsetAtom.reportWrite(value, super.offset, () {
      super.offset = value;
    });
  }

  late final _$limitAtom = Atom(name: '_HomeStore.limit', context: context);

  @override
  String get limit {
    _$limitAtom.reportRead();
    return super.limit;
  }

  @override
  set limit(String value) {
    _$limitAtom.reportWrite(value, super.limit, () {
      super.limit = value;
    });
  }

  late final _$getFullPokemonAsyncAction =
      AsyncAction('_HomeStore.getFullPokemon', context: context);

  @override
  Future getFullPokemon() {
    return _$getFullPokemonAsyncAction.run(() => super.getFullPokemon());
  }

  late final _$getMorePokemonAsyncAction =
      AsyncAction('_HomeStore.getMorePokemon', context: context);

  @override
  Future getMorePokemon() {
    return _$getMorePokemonAsyncAction.run(() => super.getMorePokemon());
  }

  late final _$handleInitHomeAppAsyncAction =
      AsyncAction('_HomeStore.handleInitHomeApp', context: context);

  @override
  Future handleInitHomeApp() {
    return _$handleInitHomeAppAsyncAction.run(() => super.handleInitHomeApp());
  }

  late final _$onGetPokemonResultAsyncAction =
      AsyncAction('_HomeStore.onGetPokemonResult', context: context);

  @override
  Future onGetPokemonResult() {
    return _$onGetPokemonResultAsyncAction
        .run(() => super.onGetPokemonResult());
  }

  late final _$savePokemonListAsyncAction =
      AsyncAction('_HomeStore.savePokemonList', context: context);

  @override
  Future<void> savePokemonList() {
    return _$savePokemonListAsyncAction.run(() => super.savePokemonList());
  }

  late final _$getSharedPokemonListAsyncAction =
      AsyncAction('_HomeStore.getSharedPokemonList', context: context);

  @override
  Future<void> getSharedPokemonList() {
    return _$getSharedPokemonListAsyncAction
        .run(() => super.getSharedPokemonList());
  }

  late final _$getSharedFavoritePokemonListAsyncAction =
      AsyncAction('_HomeStore.getSharedFavoritePokemonList', context: context);

  @override
  Future<void> getSharedFavoritePokemonList() {
    return _$getSharedFavoritePokemonListAsyncAction
        .run(() => super.getSharedFavoritePokemonList());
  }

  late final _$removeSharedPokemonListAsyncAction =
      AsyncAction('_HomeStore.removeSharedPokemonList', context: context);

  @override
  Future<void> removeSharedPokemonList() {
    return _$removeSharedPokemonListAsyncAction
        .run(() => super.removeSharedPokemonList());
  }

  late final _$saveResultAsyncAction =
      AsyncAction('_HomeStore.saveResult', context: context);

  @override
  Future<void> saveResult() {
    return _$saveResultAsyncAction.run(() => super.saveResult());
  }

  late final _$getSharedResultAsyncAction =
      AsyncAction('_HomeStore.getSharedResult', context: context);

  @override
  Future<void> getSharedResult() {
    return _$getSharedResultAsyncAction.run(() => super.getSharedResult());
  }

  late final _$setPokemonFavoriteAsyncAction =
      AsyncAction('_HomeStore.setPokemonFavorite', context: context);

  @override
  Future setPokemonFavorite(PokemonEntity pokemon) {
    return _$setPokemonFavoriteAsyncAction
        .run(() => super.setPokemonFavorite(pokemon));
  }

  late final _$getBatteryLevelAsyncAction =
      AsyncAction('_HomeStore.getBatteryLevel', context: context);

  @override
  Future<void> getBatteryLevel() {
    return _$getBatteryLevelAsyncAction.run(() => super.getBatteryLevel());
  }

  late final _$_HomeStoreActionController =
      ActionController(name: '_HomeStore', context: context);

  @override
  void setCurrentPokemonName(String name) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setCurrentPokemonName');
    try {
      return super.setCurrentPokemonName(name);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearText() {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.clearText');
    try {
      return super.clearText();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchPokemon(String query) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.searchPokemon');
    try {
      return super.searchPokemon(query);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemonResultList: ${pokemonResultList},
pokemonList: ${pokemonList},
favoritePokemonList: ${favoritePokemonList},
searchPokemonList: ${searchPokemonList},
result: ${result},
currentPokemonName: ${currentPokemonName},
isLoading: ${isLoading},
batteryLevel: ${batteryLevel},
isCompleted: ${isCompleted},
errorMessage: ${errorMessage},
searchText: ${searchText},
offset: ${offset},
limit: ${limit}
    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favoritePlaces_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoritePlacesStore on _FavoritePlacesStoreBase, Store {
  final _$valueAtom = Atom(name: '_FavoritePlacesStoreBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_FavoritePlacesStoreBaseActionController =
      ActionController(name: '_FavoritePlacesStoreBase');

  @override
  void increment() {
    final _$actionInfo = _$_FavoritePlacesStoreBaseActionController.startAction(
        name: '_FavoritePlacesStoreBase.increment');
    try {
      return super.increment();
    } finally {
      _$_FavoritePlacesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
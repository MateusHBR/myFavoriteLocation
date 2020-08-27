// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_greate_places.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreGreatePlaces on _StoreGeratePlacesBase, Store {
  Computed<ObservableList<Place>> _$itemsComputed;

  @override
  ObservableList<Place> get items =>
      (_$itemsComputed ??= Computed<ObservableList<Place>>(() => super.items,
              name: '_StoreGeratePlacesBase.items'))
          .value;

  @override
  String toString() {
    return '''
items: ${items}
    ''';
  }
}

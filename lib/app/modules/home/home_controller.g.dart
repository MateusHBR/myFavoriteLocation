// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<ObservableList<Place>> _$itemsComputed;

  @override
  ObservableList<Place> get items =>
      (_$itemsComputed ??= Computed<ObservableList<Place>>(() => super.items,
              name: '_HomeControllerBase.items'))
          .value;
  Computed<ObservableFuture<List<Map<String, dynamic>>>> _$itemFutureComputed;

  @override
  ObservableFuture<List<Map<String, dynamic>>> get itemFuture =>
      (_$itemFutureComputed ??=
              Computed<ObservableFuture<List<Map<String, dynamic>>>>(
                  () => super.itemFuture,
                  name: '_HomeControllerBase.itemFuture'))
          .value;

  @override
  String toString() {
    return '''
items: ${items},
itemFuture: ${itemFuture}
    ''';
  }
}

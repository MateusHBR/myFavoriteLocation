import 'dart:io';
import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:my_favorite_location/app/shared/location_util/location_util.dart';
import 'package:my_favorite_location/app/shared/models/place.dart';
import 'package:my_favorite_location/app/shared/storage/db_util.dart';
part 'store_grate_places.g.dart';

class StoreGreatePlaces = _StoreGeratePlacesBase with _$StoreGreatePlaces;

abstract class _StoreGeratePlacesBase with Store {
  _StoreGeratePlacesBase() {
    loadPlaces();
  }

  static ObservableFuture<List<Map<String, dynamic>>> emptyResponse =
      ObservableFuture.value([]);

  ObservableFuture<List<Map<String, dynamic>>> getItemFuture = emptyResponse;

  ObservableList<Place> _items = <Place>[].asObservable();

  @computed
  ObservableList<Place> get items {
    return _items.asObservable();
  }

  void loadPlaces() {
    getItemFuture = DbUtil.getData('places').asObservable();

    getItemFuture.whenComplete(
      () {
        return _items.addAll(
          getItemFuture.value
              .map(
                (item) => Place(
                  id: item['id'],
                  title: item['title'],
                  location: PlaceLocation(
                      latitude: item['latitude'],
                      longitude: item['longitude'],
                      address: item['address']),
                  image: File(
                    item['image'],
                  ),
                ),
              )
              .toList()
              .asObservable(),
        );
      },
    );
  }

  Future<void> addPlace(String title, File image, LatLng position) async {
    String address = await LocationUtil.getAddressFrom(position);

    final newPlace = Place(
      id: Random().nextDouble().toString(),
      title: title,
      image: image,
      location: PlaceLocation(
        latitude: position.latitude,
        longitude: position.longitude,
        address: address,
      ),
    );

    DbUtil.insert(
      'places',
      newPlace.toJson(),
    );

    _items.add(newPlace);
  }
}

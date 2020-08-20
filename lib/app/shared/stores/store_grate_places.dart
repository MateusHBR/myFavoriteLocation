import 'package:mobx/mobx.dart';
import 'package:my_favorite_location/app/shared/models/place.dart';
part 'store_grate_places.g.dart';

class StoreGratePlaces = _StoreGratePlacesBase with _$StoreGratePlaces;

abstract class _StoreGratePlacesBase with Store {
  ObservableList<Place> _items = <Place>[].asObservable();

  @computed
  ObservableList<Place> get items {
    return [..._items].asObservable();
  }

  int get itemsCount => _items.length;

  Place itemByIndex(int index) => _items[index];
}

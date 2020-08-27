import 'package:mobx/mobx.dart';
import 'package:my_favorite_location/app/shared/models/place.dart';
import 'package:my_favorite_location/app/shared/stores/store_greate_places.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final StoreGreatePlaces _storeGratePlaces;

  _HomeControllerBase(this._storeGratePlaces);

  @computed
  ObservableList<Place> get items =>
      [..._storeGratePlaces.items].asObservable();

  @computed
  ObservableFuture<List<Map<String, dynamic>>> get itemFuture =>
      _storeGratePlaces.getItemFuture.asObservable();
}

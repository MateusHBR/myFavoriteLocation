import 'package:my_favorite_location/app/modules/home/screens/place_detail_screen.dart';
import 'package:my_favorite_location/app/shared/stores/store_greate_places.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get<StoreGreatePlaces>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
        Router(
          'detail-screen',
          child: (_, args) => PlaceDetailScreen(
            place: args.data,
          ),
        ),
      ];

  static Inject get to => Inject<HomeModule>.of();
}

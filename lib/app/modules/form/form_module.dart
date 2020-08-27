import 'package:my_favorite_location/app/modules/form/screens/map_screen.dart';
import 'package:my_favorite_location/app/shared/stores/store_greate_places.dart';

import 'form_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'form_page.dart';

class FormModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FormController(i.get<StoreGreatePlaces>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => FormPage()),
        Router(
          '/map_screen',
          child: (_, args) => MapScreen(
            currentLocation: args.data[0],
            isReadOnly: args.data[1],
          ),
          transition: TransitionType.scale,
        ),
      ];

  static Inject get to => Inject<FormModule>.of();
}

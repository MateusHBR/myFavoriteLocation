import 'package:my_favorite_location/app/modules/form/form_module.dart';
import 'package:my_favorite_location/app/shared/stores/store_greate_places.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:my_favorite_location/app/app_widget.dart';
import 'package:my_favorite_location/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => StoreGreatePlaces()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
        Router(
          '/form',
          module: FormModule(),
          transition: TransitionType.rightToLeft,
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}

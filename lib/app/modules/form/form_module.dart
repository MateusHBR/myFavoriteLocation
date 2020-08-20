import 'form_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'form_page.dart';

class FormModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FormController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => FormPage()),
      ];

  static Inject get to => Inject<FormModule>.of();
}

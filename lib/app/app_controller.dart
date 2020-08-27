import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  _AppControllerBase() {
    geolocator.checkGeolocationPermissionStatus();
  }

  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
}

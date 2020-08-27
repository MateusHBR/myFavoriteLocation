import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:mobx/mobx.dart';
import 'package:my_favorite_location/app/shared/location_util/location_util.dart';
import 'package:my_favorite_location/app/shared/stores/store_greate_places.dart';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'form_controller.g.dart';

class FormController = _FormControllerBase with _$FormController;

abstract class _FormControllerBase with Store {
  final StoreGreatePlaces _storeGratePlaces;

  _FormControllerBase(this._storeGratePlaces);

  @observable
  File storedImage;

  @observable
  var staticMapImageURL;

  @observable
  var savedImage;

  @observable
  TextEditingController titleController = TextEditingController();

  @observable
  String title = '';

  @observable
  LatLng pickedPosition;

  @action
  String onTextChange(String value) => title = value;

  @action
  void clear() {
    title = '';
    titleController.clear();
  }

  @action
  Future<void> takePicture({Function onError}) async {
    try {
      final ImagePicker _picker = ImagePicker();

      PickedFile imageFile = await _picker.getImage(
        source: ImageSource.camera,
        maxWidth: 600,
      );

      if (imageFile == null) {
        return;
      }

      storedImage = File(imageFile.path);

      final appDir = await getApplicationDocumentsDirectory();
      String fileName = path.basename(storedImage.path);

      savedImage = await storedImage.copy(
        '${appDir.path}/$fileName',
      );
    } on PlatformException catch (e) {
      onError(e.code);
    }
  }

  @action
  Future<void> getCurrentUserLocation({Function onError}) async {
    try {
      final locationData = await Location().getLocation();

      staticMapImageURL = LocationUtil.generateLocationPreviewImage(
        latitude: locationData.latitude,
        longitude: locationData.longitude,
      );

      pickedPosition = LatLng(locationData.latitude, locationData.longitude);
    } on PlatformException catch (e) {
      onError(e.code);
    }
  }

  Future<void> selectOnMap({Function onError}) async {
    try {
      LatLng currentLocation = await getCurrentLocation();

      final selectedPosition = await Modular.link.pushNamed('/map_screen',
          arguments: [currentLocation, false]) as LatLng;

      if (selectedPosition == null) {
        return;
      }
      //...

      staticMapImageURL = LocationUtil.generateLocationPreviewImage(
        latitude: selectedPosition.latitude,
        longitude: selectedPosition.longitude,
      );
    } on PlatformException catch (e) {
      onError(e.code);
    }
  }

  @action
  void selectPosition(LatLng position) {
    pickedPosition = position;
  }

  void submitForm() {
    if (storedImage == null ||
        title.isEmpty ||
        savedImage == null ||
        pickedPosition == null ||
        staticMapImageURL == null) {
      return;
    }

    _storeGratePlaces.addPlace(title, savedImage, pickedPosition);

    // pickedPosition = null;

    Modular.to.pop();
  }

  Future<LatLng> getCurrentLocation() async {
    LatLng currentLocation;

    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    Position position = await geolocator.getCurrentPosition();

    currentLocation = LatLng(position.latitude, position.longitude);

    return currentLocation;
  }
}

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

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

  void submitForm() {
    print('teste');
  }
}

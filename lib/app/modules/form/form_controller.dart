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
  TextEditingController titleController = TextEditingController();

  @observable
  String title = '';

  @action
  String onTextChange(String value) => title = value;

  @action
  void clear() {
    title = '';
    titleController.clear();
  }

  @action
  Future<void> takePicture() async {
    final ImagePicker _picker = ImagePicker();

    PickedFile imageFile = await _picker.getImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );

    if (imageFile == null) {
      return;
    }

    storedImage = File(imageFile.path);
  }

  void submitForm() {
    print('teste');
  }
}

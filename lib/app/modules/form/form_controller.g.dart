// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FormController on _FormControllerBase, Store {
  final _$storedImageAtom = Atom(name: '_FormControllerBase.storedImage');

  @override
  File get storedImage {
    _$storedImageAtom.reportRead();
    return super.storedImage;
  }

  @override
  set storedImage(File value) {
    _$storedImageAtom.reportWrite(value, super.storedImage, () {
      super.storedImage = value;
    });
  }

  final _$staticMapImageURLAtom =
      Atom(name: '_FormControllerBase.staticMapImageURL');

  @override
  dynamic get staticMapImageURL {
    _$staticMapImageURLAtom.reportRead();
    return super.staticMapImageURL;
  }

  @override
  set staticMapImageURL(dynamic value) {
    _$staticMapImageURLAtom.reportWrite(value, super.staticMapImageURL, () {
      super.staticMapImageURL = value;
    });
  }

  final _$savedImageAtom = Atom(name: '_FormControllerBase.savedImage');

  @override
  dynamic get savedImage {
    _$savedImageAtom.reportRead();
    return super.savedImage;
  }

  @override
  set savedImage(dynamic value) {
    _$savedImageAtom.reportWrite(value, super.savedImage, () {
      super.savedImage = value;
    });
  }

  final _$titleControllerAtom =
      Atom(name: '_FormControllerBase.titleController');

  @override
  TextEditingController get titleController {
    _$titleControllerAtom.reportRead();
    return super.titleController;
  }

  @override
  set titleController(TextEditingController value) {
    _$titleControllerAtom.reportWrite(value, super.titleController, () {
      super.titleController = value;
    });
  }

  final _$titleAtom = Atom(name: '_FormControllerBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$pickedPositionAtom = Atom(name: '_FormControllerBase.pickedPosition');

  @override
  LatLng get pickedPosition {
    _$pickedPositionAtom.reportRead();
    return super.pickedPosition;
  }

  @override
  set pickedPosition(LatLng value) {
    _$pickedPositionAtom.reportWrite(value, super.pickedPosition, () {
      super.pickedPosition = value;
    });
  }

  final _$takePictureAsyncAction =
      AsyncAction('_FormControllerBase.takePicture');

  @override
  Future<void> takePicture({Function onError}) {
    return _$takePictureAsyncAction
        .run(() => super.takePicture(onError: onError));
  }

  final _$getCurrentUserLocationAsyncAction =
      AsyncAction('_FormControllerBase.getCurrentUserLocation');

  @override
  Future<void> getCurrentUserLocation({Function onError}) {
    return _$getCurrentUserLocationAsyncAction
        .run(() => super.getCurrentUserLocation(onError: onError));
  }

  final _$_FormControllerBaseActionController =
      ActionController(name: '_FormControllerBase');

  @override
  String onTextChange(String value) {
    final _$actionInfo = _$_FormControllerBaseActionController.startAction(
        name: '_FormControllerBase.onTextChange');
    try {
      return super.onTextChange(value);
    } finally {
      _$_FormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo = _$_FormControllerBaseActionController.startAction(
        name: '_FormControllerBase.clear');
    try {
      return super.clear();
    } finally {
      _$_FormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectPosition(LatLng position) {
    final _$actionInfo = _$_FormControllerBaseActionController.startAction(
        name: '_FormControllerBase.selectPosition');
    try {
      return super.selectPosition(position);
    } finally {
      _$_FormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
storedImage: ${storedImage},
staticMapImageURL: ${staticMapImageURL},
savedImage: ${savedImage},
titleController: ${titleController},
title: ${title},
pickedPosition: ${pickedPosition}
    ''';
  }
}

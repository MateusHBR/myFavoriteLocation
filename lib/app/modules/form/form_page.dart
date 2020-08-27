import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:my_favorite_location/app/shared/global_scaffold/global_scaffold.dart';
import 'form_controller.dart';

class FormPage extends StatefulWidget {
  final String title;
  const FormPage({Key key, this.title = "Novo Lugar"}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends ModularState<FormPage, FormController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var appBarHeight = AppBar().preferredSize.height;

    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height:
              size.height - appBarHeight - MediaQuery.of(context).padding.top,
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    title(),
                    imageInput(primaryColor: primaryColor),
                    localizationInput(size, primaryColor),
                  ],
                ),
              ),
              buttonAddLocalization(size, primaryColor),
            ],
          ),
        ),
      ),
    );
  }

  Widget title() {
    return TextField(
      controller: controller.titleController,
      onChanged: controller.onTextChange,
      decoration: InputDecoration(
        suffixIcon: Observer(
          builder: (_) {
            return IconButton(
              icon: Icon(Icons.clear),
              onPressed: controller.title.isEmpty ? null : controller.clear,
            );
          },
        ),
        labelText: 'Título',
      ),
    );
  }

  Widget imageInput({@required Color primaryColor}) {
    return Row(
      children: [
        Observer(
          builder: (_) {
            return Container(
              margin: EdgeInsets.only(top: 10),
              width: 180,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.2,
                  color: Colors.grey,
                ),
              ),
              alignment: Alignment.center,
              child: controller.storedImage != null
                  ? Image.file(
                      controller.storedImage,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Text('Nenhuma Imagem.'),
            );
          },
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: FlatButton.icon(
            textColor: primaryColor,
            onPressed: () {
              controller.takePicture(
                onError: (String error) {
                  final snackBar = SnackBar(
                    content: Text('$error, Ative a Localização!'),
                  );
                  GlobalScaffold.instance.showSnackBar(snackBar);
                },
              );
            },
            // onPressed: () {},
            icon: Icon(Icons.camera),
            label: Text('Tirar Foto'),
          ),
        ),
      ],
    );
  }

  Widget localizationInput(Size size, Color primaryColor) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 8),
          height: size.height * 0.2,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.2,
              color: Colors.grey,
            ),
          ),
          child: Observer(
            builder: (_) {
              if (controller.staticMapImageURL == null) {
                return Center(
                  child: Text('Nenhuma localização adicionada'),
                );
              }
              return Image.network(
                controller.staticMapImageURL,
                fit: BoxFit.cover,
                width: double.infinity,
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FlatButton.icon(
              onPressed: () {
                controller.getCurrentUserLocation(
                  onError: (String error) {
                    final snackBar = SnackBar(
                      content: Text('$error, Ative a Localização!'),
                      action: SnackBarAction(
                        label: 'Ativar',
                        onPressed: controller.getCurrentLocation,
                      ),
                    );
                    GlobalScaffold.instance.showSnackBar(snackBar);
                  },
                );
              },
              icon: Icon(Icons.location_on),
              textColor: primaryColor,
              label: Text(
                'Localização Atual',
                textScaleFactor: 0.8,
              ),
            ),
            FlatButton.icon(
              onPressed: () {
                controller.selectOnMap(
                  onError: (String error) {
                    final snackBar = SnackBar(
                      content: Text('$error, Ative a Localização!'),
                      action: SnackBarAction(
                        label: 'Ativar',
                        onPressed: controller.getCurrentLocation,
                      ),
                    );
                    GlobalScaffold.instance.showSnackBar(snackBar);
                  },
                );
              },
              icon: Icon(Icons.map),
              textColor: primaryColor,
              label: Text(
                'Escolha no Mapa',
                textScaleFactor: 0.8,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buttonAddLocalization(Size size, Color primaryColor) {
    return Observer(
      builder: (_) {
        return Container(
          width: size.width,
          child: (controller.title.isEmpty ||
                  controller.storedImage == null ||
                  controller.pickedPosition == null ||
                  controller.staticMapImageURL == null)
              ? FlatButton(
                  color: primaryColor,
                  disabledColor: primaryColor.withOpacity(0.5),
                  disabledTextColor: Colors.white,
                  textColor: Colors.white,
                  onPressed: null,
                  child: Text('Adicionar local'),
                )
              : FlatButton(
                  color: primaryColor,
                  disabledColor: primaryColor.withOpacity(0.5),
                  disabledTextColor: Colors.white,
                  textColor: Colors.white,
                  onPressed: controller.submitForm,
                  child: Text('Adicionar local'),
                ),
        );
      },
    );
  }
}

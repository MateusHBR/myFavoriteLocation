import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: controller.titleController,
                    onChanged: controller.onTextChange,
                    decoration: InputDecoration(
                      suffixIcon: Observer(
                        builder: (_) {
                          return IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: controller.title.isEmpty
                                ? null
                                : controller.clear,
                          );
                        },
                      ),
                      labelText: 'Título',
                    ),
                  ),
                  imageInput(primaryColor: primaryColor),
                ],
              ),
            ),
            Observer(
              builder: (_) {
                return Container(
                  width: size.width,
                  child: (controller.title.isEmpty ||
                          controller.storedImage == null)
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
            ),
          ],
        ),
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
                  width: 1,
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
            onPressed: controller.takePicture,
            // onPressed: () {},
            icon: Icon(Icons.camera),
            label: Text('Tirar Foto'),
          ),
        ),
      ],
    );
  }
}

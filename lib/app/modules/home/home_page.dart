import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Meus Lugares"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: <Widget>[
          listOfItems(size),
        ],
      ),
      floatingActionButton: floatingButton(),
    );
  }

  Widget appBar() {
    return AppBar(
      title: Text(widget.title),
      actions: [
        IconButton(
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            Modular.to.pushNamed('/form');
          },
        ),
      ],
    );
  }

  Widget listOfItems(Size size) {
    return Expanded(
      child: Observer(
        builder: (_) {
          if (controller.itemFuture.error != null ||
              controller.itemFuture.status == FutureStatus.rejected) {
            return Center(
              child: Text('Erro Ao Carregar Dados!'),
            );
          }

          if (controller.itemFuture.status == FutureStatus.pending) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (controller.items.length == 0) {
            return Center(
              child: Text('Nenhum Item Cadastrado!'),
            );
          }

          return ListView.separated(
            itemCount: controller.items.length,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ListTile(
                  leading: controller.items[index].image == null
                      ? CircleAvatar(
                          backgroundColor: Colors.purple,
                        )
                      : CircleAvatar(
                          backgroundImage: FileImage(
                            controller.items[index].image,
                          ),
                        ),
                  title: Text('${controller.items[index].title}'),
                  subtitle: Text('${controller.items[index].location.address}'),
                  onTap: () {
                    Modular.link.pushNamed(
                      'detail-screen',
                      arguments: controller.items[index],
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget floatingButton() {
    return FloatingActionButton(
      onPressed: () {
        Modular.to.pushNamed('/form');
      },
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}

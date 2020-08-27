import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_favorite_location/app/shared/global_scaffold/global_scaffold.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter Slidy',
      builder: (context, child) {
        return Scaffold(
          key: GlobalScaffold.instance.scaffKey,
          body: child,
        );
      },
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}

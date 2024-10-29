import 'package:annonceflash_project/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Annonces Flash',
        theme: ThemeData(
          primarySwatch: Colors.blue,
      ),

      routerConfig: _appRouter.config(),
    );
  }

}

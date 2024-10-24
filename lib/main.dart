import 'package:annonceflash_project/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Annonces Flash',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

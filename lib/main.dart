import 'package:annonceflash_project/annonces/business_logic/bloc/annonce_bloc.dart';
import 'package:annonceflash_project/annonces/presentation/pages/annoces_page.dart';
import 'package:annonceflash_project/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt.get<AnnonceBloc>(),
          ),
        ],
        child: AnnoncePage(
          bloc: getIt.get<AnnonceBloc>()
        ),
      ),
    );
  }
}

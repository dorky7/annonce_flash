import 'package:annonceflash_project/annonces/data/repositories/announce_repository.dart';
import 'package:annonceflash_project/shared/routes/app_router.dart';
import 'package:annonceflash_project/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'annonces/business_logic/announce_list/announce_list_bloc.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AnnounceListBloc>(
          create: (_) => getIt.get<AnnounceListBloc>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Annonces Flash',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerConfig: _appRouter.config(),
      ),
      
    );
  }
}

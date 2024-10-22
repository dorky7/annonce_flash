import 'package:annonceflash_project/annonces/business_logic/bloc/annonce_bloc.dart';
import 'package:annonceflash_project/annonces/data/models/annonces_query_filter.dart';
import 'package:annonceflash_project/annonces/data/repositories/annoce_repository.dart';
import 'package:annonceflash_project/annonces/data/service/annonce_service.dart';
import 'package:annonceflash_project/token_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<Dio> (Dio()..interceptors.add(TokenInterceptor()));

  getIt.registerSingleton(AnnonceService(http: getIt.get<Dio>()));

  getIt.registerSingleton(
     AnnonceRepository(service: getIt.get<AnnonceService>()));

  getIt.registerSingleton(
    AnnonceBloc(
      
      repository: getIt.get<AnnonceRepository>(), 
      filter: AnnonceQueryFilter(
        limit: 30,
      ),
      ),
  );
}


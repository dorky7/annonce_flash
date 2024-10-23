import 'package:annonceflash_project/annonces/business_logic/bloc/annonce_bloc.dart';
import 'package:annonceflash_project/annonces/data/models/announce_query_filter.dart';
import 'package:annonceflash_project/annonces/data/repositories/annoce_repository.dart';
import 'package:annonceflash_project/annonces/data/service/announce_service.dart';
import 'package:annonceflash_project/token_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<Dio>(Dio()..interceptors.add(TokenInterceptor()));

  getIt.registerSingleton(AnnounceService(http: getIt.get<Dio>()));

  getIt.registerSingleton(
      AnnonceRepository(service: getIt.get<AnnounceService>()));

  getIt.registerSingleton(
    AnnonceBloc(
      repository: getIt.get<AnnonceRepository>(),
      filter: AnnonceQueryFilter(
        limit: 30,
      ),
    ),
  );
}

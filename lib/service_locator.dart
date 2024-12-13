import 'package:annonceflash_project/annonces/business_logic/announce_list/announce_list_bloc.dart';
import 'package:annonceflash_project/annonces/data/models/announce_query_filter.dart';

import 'package:annonceflash_project/annonces/data/repositories/announce_repository.dart';
import 'package:annonceflash_project/annonces/data/service/announce_service.dart';
import 'package:annonceflash_project/auth/business_logic/bloc/auth_bloc.dart';
import 'package:annonceflash_project/auth/data/repositories/auth_repository.dart';
import 'package:annonceflash_project/auth/data/services/auth_service.dart';
import 'package:annonceflash_project/categories/business_logic/bloc/category_list_bloc.dart';
import 'package:annonceflash_project/categories/data/reposetories/category_repository.dart';
import 'package:annonceflash_project/categories/data/services/category_service.dart';
import 'package:annonceflash_project/shared/config.dart';
import 'package:annonceflash_project/token_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: AppConfig.baseUrl,
      ),
    )..interceptors.add(TokenInterceptor()),
  );

  getIt.registerSingleton(AuthService(http: getIt.get<Dio>()));

  getIt.registerSingleton(
    AuthRepository(
      getIt.get<AuthService>(),
    ),
  );

  getIt.registerSingleton(
    AuthBloc(
      repository: getIt.get<AuthRepository>(),
    )..add(CheckAuthStateEvent()),
  );

  getIt.registerSingleton(AnnounceService(http: getIt.get<Dio>()));

  getIt.registerSingleton(
    AnnounceRepository(service: getIt.get<AnnounceService>()),
  );

  getIt.registerSingleton(
    AnnounceListBloc(
      repository: getIt.get<AnnounceRepository>(),
    )..add(
        FetchAnnounceListEvent(
          filter: AnnounceQueryFilter(
            perPage: 50,
          ),
        ),
      ),
  );

  getIt.registerSingleton(CategoryService(http: getIt.get<Dio>()));

  getIt.registerSingleton(
    CategoryRepository(service: getIt.get<CategoryService>()),
  );

  getIt.registerSingleton(
    CategoryListBloc(
      repository: getIt.get<CategoryRepository>(),
    )..add(
        FetchCategoryListEvent(),
      ),
  );
}

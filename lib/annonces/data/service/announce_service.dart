import 'package:annonceflash_project/annonces/data/models/announce_query_filter.dart';
import 'package:dio/dio.dart';

class AnnounceService {
  final Dio http;

  AnnounceService({
    required this.http,
  });

  Future<dynamic> getAnnonces({
    required AnnonceQueryFilter filter,
  }) async {
    var path = filter.category != null
        ? '/annonces/category/${filter.category}'
        : '/annonces';

    path = "$path?limit=${filter.limit}";

    if (filter.skip != null) {
      path = "$path&skip=${filter.skip}";
    }

    if (filter.search != null) {
      path = "$path&search=${filter.search}";
    }

    if (filter.sortBy != null) {
      path = "$path&sortBy=${filter.sortBy}&order=${filter.order}";
    }

    if (filter.startDate != null) {
      path = "$path&startDate=${filter.startDate!.toIso8601String()}";
    }

    if (filter.endDate != null) {
      path = "$path&endDate=${filter.endDate!.toIso8601String()}";
    }

    Response response = await http.get(path);
    return response.data;
  }
}

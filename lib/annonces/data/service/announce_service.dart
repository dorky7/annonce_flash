import 'package:annonceflash_project/annonces/data/models/announce_query_filter.dart';
import 'package:dio/dio.dart';

class AnnounceService {
  final Dio http;

  AnnounceService({
    required this.http,
  });

  Future<dynamic> getAnnounces({
    required AnnounceQueryFilter filter,
  }) async {
    Response response = await http.get('/posts${filter.build()}');
    return response.data;
  }
}

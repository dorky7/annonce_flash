import 'package:annonceflash_project/annonces/data/models/annonce_model.dart';
import 'package:annonceflash_project/annonces/data/models/annonces_query_filter.dart';
import 'package:annonceflash_project/annonces/data/service/annonce_service.dart';

class AnnonceRepository {
  final AnnonceService service;

  AnnonceRepository({
    required this.service,
  });

  Future<List<AnnonceModel>> getAnnonces({
    required AnnonceQueryFilter filter,
  }) async {
    final data = await service.getAnnonces(
      filter: filter,
    );

    return (data['annonces'] as List)
        .map((json) => AnnonceModel.fromJson(json))
        .toList();
  }
}
import 'package:annonceflash_project/annonces/data/models/announce_model.dart';
import 'package:annonceflash_project/annonces/data/models/announce_query_filter.dart';
import 'package:annonceflash_project/annonces/data/service/announce_service.dart';

class AnnonceRepository {
  final AnnounceService service;

  AnnonceRepository({
    required this.service,
  });

  Future<List<AnnounceModel>> getAnnonces({
    required AnnonceQueryFilter filter,
  }) async {
    final data = await service.getAnnonces(
      filter: filter,
    );

    return (data['annonces'] as List)
        .map((json) => AnnounceModel.fromJson(json))
        .toList();
  }
}

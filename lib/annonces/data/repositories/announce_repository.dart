import 'package:annonceflash_project/annonces/data/models/announce_model.dart';
import 'package:annonceflash_project/annonces/data/models/announce_query_filter.dart';
import 'package:annonceflash_project/annonces/data/service/announce_service.dart';
import 'package:annonceflash_project/shared/models/paginated_data.dart';

class AnnounceRepository {
  final AnnounceService service;

  AnnounceRepository({
    required this.service,
  });

  Future<PaginatedData<AnnounceModel>> getAnnounces({
    required AnnounceQueryFilter filter,
  }) async {
    final data = await service.getAnnounces(
      filter: filter,
    );

    return PaginatedData.fromJson(
      json: data['result'],
      fromJsonT: AnnounceModel.fromJson,
    );
  }
}

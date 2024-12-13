import 'package:annonceflash_project/categories/data/model/category_model.dart';
import 'package:annonceflash_project/categories/data/services/category_service.dart';
import 'package:annonceflash_project/shared/models/paginated_data.dart';

class CategoryRepository {
  final CategoryService service;

  CategoryRepository({
    required this.service,
  });

  Future<PaginatedData<CategoryModel>> fetchCategories() async {
    final data = await service.fetchCategories();
    return PaginatedData<CategoryModel>.fromJson(
      json: data['result'],
      fromJsonT: CategoryModel.fromJson,
    );
  }
}

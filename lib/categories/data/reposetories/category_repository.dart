import 'package:annonceflash_project/categories/data/model/category_model.dart';
import 'package:annonceflash_project/categories/data/services/category_service.dart';

class CategoryRepository {
  final CategoryService service;

  CategoryRepository({
    required this.service,
  });

  Future<List<CategoryModel>> fetchCategories() async {
    final data = await service.fetchCategories();
    return (data['result']['data'] as List ).map((json)=>CategoryModel.fromJson(json)).toList();
  }
}

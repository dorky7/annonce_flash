import 'package:annonceflash_project/category/data/category_service.dart';


class CategoryRepository {
  final CategoryService service;
   CategoryRepository({required this.service});

  Future<List<String>> fetchCategories() async {
    final data = await service.fetchCategories();
    return List<String>.from(data.map((x) => x));
  }
}

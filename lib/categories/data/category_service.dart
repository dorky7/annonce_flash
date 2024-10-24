import 'package:dio/dio.dart';

class CategoryService {
  final Dio http;

  CategoryService({
    required this.http,
  });

  Future<dynamic> fetchCategories() async {
    Response response = await http.get('/api/categories');
    return response.data;
  }
}
import 'dart:convert';

import 'package:annonceflash_project/publier/data/modele/publish_model.dart';
import 'package:http/http.dart' as http;

class PublishRepository {
  final String _baseUrl = 'https://annonceflash.com'; 

  Future<PublishModel> publish(PublishModel publishModel) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/api/posts/{id}'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: publishModel.toJson(),
    );

    if (response.statusCode == 201) {
      return PublishModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Erreur de publication');
    }
  }

  Future<List<PublishModel>> getPublishes() async {
    final response = await http.get(Uri.parse('$_baseUrl/api/posts/{id}'));

    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((json) => PublishModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Erreur de récupération des publications');
    }
  }
}
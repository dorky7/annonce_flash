import 'package:annonceflash_project/publier/data/modele/publish_model.dart';
import 'package:annonceflash_project/publier/data/repository/repository_publier.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PublishService {
  final PublishRepository _repository = PublishRepository();

  Future<PublishModel> publish(PublishModel publishModel) async {
    return await _repository.publish(publishModel);
  }

  Future<List<PublishModel>> getPublishes() async {
    return await _repository.getPublishes();
  }
}
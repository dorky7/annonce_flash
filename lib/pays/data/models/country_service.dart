

import 'package:dio/dio.dart';

class CountryService {
  final Dio http;

  CountryService({
    required this.http,
  });

  Future<dynamic> fetchCountries() async{
    Response response = await http.get('/countries');
    return response.data;
  }
}
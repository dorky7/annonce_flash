import 'package:annonceflash_project/auth/data/models/register_request.dart';
import 'package:annonceflash_project/shared/utils.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final Dio http;

  AuthService({
    required this.http,
  });

  Future<dynamic> login({
    required String email,
    required String password,
  }) async {
    Response response = await http.post(
      '/auth/login',
      data: {
        "email": email,
        "password": password,
        "auth_field": "email",
        "phone": null,
        "phone_country": null
      },
    );
    return response.data;
  }

  Future<dynamic> signUp({
    required RegisterRequest request,
  }) async {
    final ip = await Utils.getIPAddress();
    final data = request.copyWith(
      create_from_ip: ip ?? '127.0.0.1',
    );
    Response response = await http.post(
      '/users',
      data: FormData.fromMap(
        data.toJson(),
      ),
    );
    return response.data;
  }

  Future<dynamic> getCurrentUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var userId = prefs.getString('userId');
    Response response = await http.get('/auth/logout/$userId');
    return response.data;
  }
}

import 'package:dio/dio.dart';

class AuthService {
  final Dio http;

  AuthService({
    required this.http,
  });

  Future<dynamic> login({
    required String username,
    required String password,
  }) async {
    Response response = await http.post(
      '/auth/login',
      data: {
        "username": username,
        "password": password,
      },
    );
    return response.data;
  }

  Future<dynamic> getCurrentUser() async {
    Response response = await http.get('/api/auth/login');
    return response.data;
  }
}

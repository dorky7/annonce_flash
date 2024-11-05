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
      },
    );
    return response.data;
  }

  Future<dynamic> getCurrentUser() async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();

    var userId =  prefs.getString('userId');
    Response response = await http.get('/auth/logout/$userId');
    return response.data;
  }
}

import 'package:annonceflash_project/auth/data/models/user_model.dart';
import 'package:annonceflash_project/auth/data/services/auth_service.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  AuthService service;

  AuthRepository(this.service);

  Future<UserModel?> login({
    required String email,
    required String password,
  }) async {
    var data = await service.login(
      email: email,
      password: password,
    );

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', data['extra']["authToken"]);

    return UserModel.fromJson(data["result"]);
  }


  Future<UserModel?> signUp({
    required String email,
    required String password,
  }) async {
    return null;
  }

  Future<dynamic> getCurrentUser() async {
    var data = await service.getCurrentUser();

    return UserModel.fromJson(data);
  }
}

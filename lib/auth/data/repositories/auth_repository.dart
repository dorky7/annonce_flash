import 'dart:convert';
import 'dart:developer';
import 'package:annonceflash_project/auth/data/models/user_model.dart';
import 'package:annonceflash_project/auth/data/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  AuthService service;

  AuthRepository( this.service);

  Future<UserModel?> login({
    required String email, 
    required String password,
    }) async {
    var data = await service.login(
      email:email,
      password:password,
    );
    
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', data['extra']["authToken"]);
    await prefs.setString('refreshToken', data ['refreshToken']);
  await prefs.setString('userId', data['result']['id']);

    return  UserModel.fromJson(data["result"]);
  

  }
  Future<dynamic> getCurrentUser() async{
    var data = await service.getCurrentUser();

    return UserModel.fromJson(data);
  }
}


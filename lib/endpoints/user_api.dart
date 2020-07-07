import 'dart:async';
import 'dart:convert';

import '../models/user.dart';
import 'package:http/http.dart' as http;

class UserApi {

  static String token;

  Future<User> login(String email, String password) async {
    final response = await http.post(
      'https://flux-control-node-api.herokuapp.com/api/users/login',
      body: {
        'email': email,
        'password': password
      }
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      token = data['token'];
      return User.fromJson(data['user']);

    } else if (response.statusCode == 401) {
      throw Exception('Credênciais inválidas');

    } else {
      throw Exception('Falha na autenticação');
    }
  }

  Future<User> getUser(String id) async {
    final response = await http.get('https://flux-control-node-api.herokuapp.com/users/get/' + id,
      headers: {
        'authorization': "bearer " + token
      }
    );

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load users');
    }
  }
}
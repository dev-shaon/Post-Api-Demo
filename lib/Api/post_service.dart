// post_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:post_api/Api/model.dart';

class ApiService {
  final String registerUrl = "https://api.zhndev.site/wp-json/base/api/auth/register";
  final String loginUrl = "https://api.zhndev.site/wp-json/base/api/auth/login";

  Future<bool> registerUser(UserModel user) async {
    final response = await http.post(
      Uri.parse(registerUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(user.toJson()),
    );

    print("Register Sending Data: ${user.toJson()}");
    print("Register Response Code: ${response.statusCode}");
    print("Register Response Body: ${response.body}");

    return response.statusCode == 201 || response.statusCode == 200;
  }

  Future<bool> loginUser(String username, String password) async {
    final response = await http.post(
      Uri.parse(loginUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "username": username,
        "password": password,
      }),
    );

    print("Login Request: {email: $username, password: }");
    print("Login Response Code: ${response.statusCode}");
    print("Login Response Body: ${response.body}");


    return response.statusCode == 200;
  }
}

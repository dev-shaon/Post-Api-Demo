import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:post_api/Api/model.dart';

class ApiService {

  Future<bool> registerUser(UserModel user) async {

    final response = await http.post(Uri.parse("https://jsonplaceholder.typicode.com/users"),

      headers: {"Content-Type": "application/json"},

      body: jsonEncode(user.toJson()),
    );

    print(" Sending Data: ${user.toJson()}");

    print(" Response Code: ${response.statusCode}");
    print(" Response Body: ${response.body}");

    if (response.statusCode == 201 || response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}

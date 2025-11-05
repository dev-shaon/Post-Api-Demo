import 'package:flutter/material.dart';
import 'package:post_api/Api/model.dart';
import 'package:post_api/Api/post_service.dart';

class UserProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  bool isLoading = false;

  Future<bool> Submit(UserModel user) async {
    isLoading = true;
    notifyListeners();

    final success = await _apiService.registerUser(user);

    isLoading = false;
    notifyListeners();

    return success;
  }

  Future<bool> loginUser(String username, String password) async {
    isLoading = true;
    notifyListeners();

    bool success = await _apiService.loginUser(username, password);

    isLoading = false;
    notifyListeners();

    return success;
  }
}

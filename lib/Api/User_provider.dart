import 'package:flutter/material.dart';
import 'package:post_api/Api/model.dart';
import 'package:post_api/Api/post_service.dart';

class UserProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  bool isLoading = false;

  Future<bool> Submit(UserModel user) async {
    try {
      isLoading = true;
      notifyListeners();

      bool success = await _apiService.registerUser(user);
      return success;

    } catch (e) {
      print("Submit error: $e");
      return false;

    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> loginUser(String username, String password) async {
    try {
      isLoading = true;
      notifyListeners();

      bool success = await _apiService.loginUser(username, password);
      return success;

    } catch (e) {
      print("Login error: $e");
      return false;

    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

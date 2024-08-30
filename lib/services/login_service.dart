import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wi_jungle/constants/constants.dart';

class LoginService {
  final String _baseLoginUrl = baseLoginUrl;

  // Method to construct URL with query parameters
  String _constructUrl(String username, String password) {
    return '$_baseLoginUrl&username=$username&password=$password';
  }

  // Method to handle the response
  bool _handleResponse(Map<String, dynamic> responseData) {
    if (responseData['status'] == 'success') {
      debugPrint('Login successful. Key: ${responseData['key']}');
      return true;
    } else if (responseData['status'] == 'fail') {
      debugPrint('Login failed: ${responseData['errors']}');
      return false;
    } else {
      debugPrint('Unexpected status in response: ${responseData['status']}');
      return false;
    }
  }

  Future<bool> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse(_constructUrl(username, password)),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return _handleResponse(responseData);
      } else {
        debugPrint('Server error: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      debugPrint('Exception occurred: $e');
      return false;
    }
  }
}

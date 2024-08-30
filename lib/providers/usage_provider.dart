import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wi_jungle/constants/constants.dart';
import 'package:wi_jungle/models/usage_model.dart';

class UsageProvider with ChangeNotifier {
  UsageModel? _usageModel;

  UsageModel? get usageModel => _usageModel;

  Future<void> fetchUsage() async {
    try {
      final response = await http.get(Uri.parse(winServiceUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _usageModel = UsageModel.fromJson(data);
        notifyListeners();
      } else {
        throw Exception('Failed to load usage data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}

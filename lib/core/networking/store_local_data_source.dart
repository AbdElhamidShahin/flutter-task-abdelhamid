import 'dart:convert';
import 'package:flutter/services.dart';

class StoreLocalData {
  Future<List<dynamic>> fetchData({required String baseUrl}) async {
    final response = await rootBundle.loadString(baseUrl);
    final data = jsonDecode(response);
    return data;
  }
}

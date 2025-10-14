import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_tast_abdelhamid/core/networking/constants.dart';

import 'category_model.dart';

class StoreLocalData {
  @override
  Future<List<CategoryModel>> fetchData() async {
    try {
      final response = await rootBundle.loadString(Constants.BaseUrl);

      final Map<String, dynamic> jsonMap = json.decode(response);
      final List<dynamic> jsonList = jsonMap['categories'];
      final List<CategoryModel> categories = jsonList
          .map((jsonItem) => CategoryModel.fromJson(jsonItem))
          .toList();
      return categories;
    } catch (e) {
      print("Error loading store data from assets: $e");
      throw Exception("Failed to load store data");
    }
  }
}

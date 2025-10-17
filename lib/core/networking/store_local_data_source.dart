import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_tast_abdelhamid/core/networking/constants.dart';

import 'category_model.dart';

class StoreLocalData {
  @override
  Future<List<CategoryModel>> fetchData() async {
    final response = await rootBundle.loadString(Constants.BaseUrl);

    final List<dynamic> jsonList = json.decode(response);

    final List<CategoryModel> categories = jsonList
        .map((jsonItem) => CategoryModel.fromJson(jsonItem))
        .toList();
    return categories;
  }
}

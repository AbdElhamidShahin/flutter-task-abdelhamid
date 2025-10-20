import 'package:flutter_tast_abdelhamid/core/networking/constants.dart';
import 'package:flutter_tast_abdelhamid/features/home/data/repos/repos.dart';

import '../../../../core/networking/category_model.dart';
import '../../../../core/networking/store_local_data_source.dart';

class HomeRepositoryImplement implements HomeRepository {
  final StoreLocalData _localDataSource;

  HomeRepositoryImplement(this._localDataSource);
  @override
  Future<List<CategoryModel>> fetchData() async {
    final List<dynamic> jsonList = await _localDataSource.fetchData(
      baseUrl: Constants.BaseUrl,
    );

    final List<CategoryModel> categories = jsonList
        .map((jsonItem) => CategoryModel.fromJson(jsonItem))
        .toList();
    return categories;
  }
}

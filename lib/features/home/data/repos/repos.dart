import '../../../../core/networking/category_model.dart';
import '../../../../core/networking/store_local_data_source.dart';

class HomeRepository {
  final StoreLocalData _localDataSource;

  HomeRepository(this._localDataSource);

  Future<List<CategoryModel>> fetchData() async {
    return await _localDataSource.fetchData();
  }
}

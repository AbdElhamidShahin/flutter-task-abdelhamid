import '../../../../core/networking/category_model.dart';

abstract class HomeRepository {
  Future<List<CategoryModel>> fetchData();
}

import '../../../core/networking/add_packages_model.dart';

abstract class PackagesRepo {
  Future<List<AddPackagesModel>> PackagesfetchData();
}

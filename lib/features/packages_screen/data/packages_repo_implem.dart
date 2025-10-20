import 'package:flutter_tast_abdelhamid/core/networking/add_packages_model.dart';
import 'package:flutter_tast_abdelhamid/core/networking/constants.dart';
import 'package:flutter_tast_abdelhamid/core/networking/store_local_data_source.dart';
import 'package:flutter_tast_abdelhamid/features/packages_screen/data/packages_repo.dart';

class PackagesRepoImplem implements PackagesRepo {
  final StoreLocalData _storeLocalData;

  PackagesRepoImplem(this._storeLocalData);
  @override
  Future<List<AddPackagesModel>> PackagesfetchData() async {

    final List<dynamic> jsonList = await _storeLocalData.fetchData(
      baseUrl: Constants.PackagesBaseUrl,
    );


    final List<AddPackagesModel> packages = jsonList
        .map((jsonItem) => AddPackagesModel.fromJson(jsonItem))
        .toList();
    return packages;
  }
}

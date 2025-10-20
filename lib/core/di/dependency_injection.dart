import 'package:flutter_tast_abdelhamid/core/networking/store_local_data_source.dart';
import 'package:flutter_tast_abdelhamid/features/home/data/repos/reposImple.dart';
import 'package:flutter_tast_abdelhamid/features/home/logic/cubit.dart';
import 'package:flutter_tast_abdelhamid/features/packages_screen/data/packages_repo.dart';
import 'package:flutter_tast_abdelhamid/features/packages_screen/logic/packages_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/repos/repos.dart';
import '../../features/packages_screen/data/packages_repo_implem.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  //store local data

  getIt.registerLazySingleton<StoreLocalData>(() => StoreLocalData());
  //home screen

  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImplement(getIt()),
  );
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));

  //packages screen
  getIt.registerLazySingleton<PackagesRepo>(() => PackagesRepoImplem(getIt()));
  getIt.registerFactory<PackagesCubit>(() => PackagesCubit(getIt()));
}

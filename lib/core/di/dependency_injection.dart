
import 'package:flutter_tast_abdelhamid/core/networking/store_local_data_source.dart';
import 'package:flutter_tast_abdelhamid/features/home/data/repos/reposImple.dart';
import 'package:flutter_tast_abdelhamid/features/home/logic/cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/repos/repos.dart';


final getIt = GetIt.instance;

Future<void> setupGetIt() async {

  getIt.registerLazySingleton<StoreLocalData>(() => StoreLocalData());
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepositoryImplement(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));




}

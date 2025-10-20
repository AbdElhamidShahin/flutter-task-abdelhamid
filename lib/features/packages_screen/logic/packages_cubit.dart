import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tast_abdelhamid/features/packages_screen/data/packages_repo.dart';
import 'package:flutter_tast_abdelhamid/features/packages_screen/logic/packages_state.dart';

class PackagesCubit extends Cubit<PackagesState> {
  final PackagesRepo _packagesRepo;
  PackagesCubit(this._packagesRepo) : super(PackagesState.initial());

  void PackagesfetchData() async {
    emit(PackagesState.loading());
    try {
      final response = await _packagesRepo.PackagesfetchData();

      emit(PackagesState.success(response));
    } catch (error) {
      emit(PackagesState.error(error.toString()));
    }
  }
}

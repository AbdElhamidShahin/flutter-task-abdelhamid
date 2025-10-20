import 'package:flutter_tast_abdelhamid/core/networking/add_packages_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'packages_state.freezed.dart';

@Freezed()
class PackagesState with _$PackagesState {
  const factory PackagesState.initial() = _initial;
  const factory PackagesState.success(List<AddPackagesModel> packages) =
      _Success;
  const factory PackagesState.error(final String error) = _Error;
  const factory PackagesState.loading() = _Loading;
}

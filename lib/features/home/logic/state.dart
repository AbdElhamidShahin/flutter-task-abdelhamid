import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/networking/category_model.dart';
part 'state.freezed.dart';

@Freezed()
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.success(List<CategoryModel> categories) = _Success;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.error({required String error}) = _Error;
}

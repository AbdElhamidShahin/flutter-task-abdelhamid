import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tast_abdelhamid/features/home/logic/state.dart';
import '../../../core/networking/category_model.dart';
import '../data/repos/repos.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _storeRepository;
  int selectedIndex = 0;
  List<CategoryModel> _categories = [];

  HomeCubit(this._storeRepository) : super(HomeState.initial());

  void fetchData() async {
    emit(HomeState.loading());
    try {
      final response = await _storeRepository.fetchData();
      emit(HomeState.success(response));
    } catch (error) {
      emit(HomeState.error(error: error.toString()));
    }
  }

  void changeCategory(int index) {
    selectedIndex = index;
    emit(HomeState.success(_categories));
  }
}

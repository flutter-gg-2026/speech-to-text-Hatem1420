import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fahad_pac_clean/features/home/domain/use_cases/home_use_case.dart';
import 'package:fahad_pac_clean/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeUseCase _homeUseCase;

  HomeCubit(this._homeUseCase) : super(HomeInitialState());

  Future<void> getHomeMethod() async {
    final result = await _homeUseCase.getHome();
    result.when(
      (success) {
        //here is when success result
      },
      (whenError) {
       //here is when error result
      },
    );
  }

  void getVoicePath(String path) {
    emit(HomeSuccessState(path: path));
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}

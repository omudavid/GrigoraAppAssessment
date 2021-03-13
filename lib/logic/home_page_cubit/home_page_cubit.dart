import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grigora_coding_challenge/logic/home_page_cubit/home_page_state.dart';
import 'package:grigora_coding_challenge/repository/providers/data_provider.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final DataProvider provider;

  HomePageCubit(this.provider) : super(InitState()) {
    initUI();
  }

  initUI() {
    emit(InitState());

    provider.getRestaurants().then((data) {
      emit(SuccessState((data)));
    }).catchError((e) {
      print(e);
      emit(FailureState());
    });
  }
}

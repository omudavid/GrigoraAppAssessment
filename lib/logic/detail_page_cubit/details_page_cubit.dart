import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grigora_coding_challenge/repository/providers/data_provider.dart';

import 'details_page_state.dart';

class DetailsPageCubit extends Cubit<DetailsPageState> {
  final DataProvider provider;

  DetailsPageCubit(this.provider) : super(InitState()) {
    initUI();
  }

  initUI() {
    emit(InitState());

    provider.getDetails().then((data) {
      emit(SuccessState((data)));
    }).catchError((e) {
      emit(FailureState());
    });
  }
}

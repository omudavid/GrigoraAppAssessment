import 'package:equatable/equatable.dart';
import 'package:grigora_coding_challenge/repository/model/restaurant_response.dart';

abstract class HomePageState extends Equatable {}

class InitState extends HomePageState {
  @override
  List<Object> get props => [];
}

class SuccessState extends HomePageState {
  final RestaurantsResponse data;

  SuccessState(this.data);

  @override
  List<Object> get props => [];
}

class FailureState extends HomePageState {
  @override
  List<Object> get props => [];
}

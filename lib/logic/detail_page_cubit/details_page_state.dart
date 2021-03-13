import 'package:equatable/equatable.dart';
import 'package:grigora_coding_challenge/repository/model/restaurant_details_response.dart';

abstract class DetailsPageState extends Equatable {}

class InitState extends DetailsPageState {
  @override
  List<Object> get props => [];
}

class SuccessState extends DetailsPageState {
  final RestaurantDetailsResponse data;

  SuccessState(this.data);

  @override
  List<Object> get props => [];
}

class FailureState extends DetailsPageState {
  @override
  List<Object> get props => [];
}

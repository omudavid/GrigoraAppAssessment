import 'package:dio/dio.dart';
import 'package:grigora_coding_challenge/repository/model/restaurant_details_response.dart';
import 'package:grigora_coding_challenge/repository/model/restaurant_response.dart';

class DataProvider {
  final _dio = Dio();
  final _restaurantsInfoUrl =
      'https://us-central1-grigora-alt.cloudfunctions.net/home';
  final _restaurantDetails =
      'https://us-central1-grigora-alt.cloudfunctions.net/details';

  Future<RestaurantsResponse> getRestaurants() async {
    var response = await _dio.get(_restaurantsInfoUrl);

    var json = response.data;
    return RestaurantsResponse.fromJson(json);
  }

  Future<RestaurantDetailsResponse> getDetails() async {
    var response = await _dio.get(_restaurantDetails);
    var json = response.data;
    print(json);
    return RestaurantDetailsResponse.fromJson(json);
  }
}

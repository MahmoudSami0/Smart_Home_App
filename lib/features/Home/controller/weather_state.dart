import '../models/weathermodel.dart';

abstract class WeatherStates {}

class WeatherInitial extends WeatherStates {}

class WeatherLoaded extends WeatherStates {
  final Weather weather;

  WeatherLoaded({required this.weather});
}

class WeatherError extends WeatherStates {
  final String message;

  WeatherError({required this.message});
}
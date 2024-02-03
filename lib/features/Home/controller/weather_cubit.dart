
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:smarthome/features/Home/controller/weather_state.dart';

import '../../../constants.dart';
import '../models/weathermodel.dart';




class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit() : super(WeatherInitial());

  Future<Position> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  Future<void> getWeather() async {


    Position position =
    await _getCurrentLocation(); // Replace with your API key
    double latitude = position.latitude;
    double longitude = position.longitude;
    final url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      Weather weather = Weather.fromJson(jsonResponse);




      emit(WeatherLoaded(weather: weather));
    } else {
      emit(WeatherError(message: 'Failed to load weather data.'));
    }
  }



  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

  List users =[];


}




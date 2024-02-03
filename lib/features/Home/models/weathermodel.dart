class Weather {
  final String location;
  final double temperature;
  final double maxTemp;
  final double minTemp;
  final int humidity;
  final String weatherState;

  Weather(
      {required this.weatherState,
      required this.maxTemp,
      required this.minTemp,
      required this.location,
      required this.temperature,
      required this.humidity});
  factory Weather.fromJson(dynamic jsonResponse) {
//var jsonData = data['current'];
    return Weather(
      maxTemp: jsonResponse['main']['temp_max'],
      minTemp: jsonResponse['main']['temp_min'],
      location: jsonResponse['name'],
      temperature: jsonResponse['main']['temp'],
      humidity: jsonResponse['main']['humidity'],
      weatherState: jsonResponse['weather'][0]['main'],
    );
  }
}

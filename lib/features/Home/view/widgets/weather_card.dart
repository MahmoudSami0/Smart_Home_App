import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:smarthome/features/Home/models/weathermodel.dart';

import '../../../../constants.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({Key? key, required this.weather}) : super(key: key);

  final Weather weather;
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      height:MediaQuery.of(context).size.height*0.25,
      child: Card(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.center,
          children: <Widget>[

            Container(
              padding: const EdgeInsets.only(
                  top: 15, left: 20, right: 20),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Text(
                      weather.location.toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(
                        color: Colors.black45,
                        fontSize: 18,
                        fontWeight:
                        FontWeight.bold,
                        fontFamily:
                        'flutterfonts',
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      DateFormat()
                          .add_MMMMEEEEd()
                          .format(DateTime.now()),
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(
                        color: Colors.black45,
                        fontSize: 14,
                        fontFamily:
                        'flutterfonts',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),

            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding:const EdgeInsets.only(left: 50),
                  child: Column(
                    children: <Widget>[
                      Text(
                        (weather.maxTemp.round()+2).toString(),
                        //  '${controller.currentWeatherData.weather![0].description}',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(
                          color: Colors.black45,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily:
                          'flutterfonts',
                        ),
                      ),
                     const SizedBox(height: 5),
                      Text(
                        weather.temperature.round().toString(),
                        // '${(controller.currentWeatherData.main!.temp! - 273.15).round().toString()}\u2103',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                            color: Colors.black45,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontFamily:
                            'flutterfonts'),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        (weather.minTemp.round()-1).toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(
                          color: Colors.black45,
                          fontSize: 14,
                          fontWeight:
                          FontWeight.bold,
                          fontFamily:
                          'flutterfonts',
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: LottieBuilder.asset(
                            Images.cloudyAnim),
                      ),
                      Text(
                        weather.weatherState.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(
                          color: Colors.black45,
                          fontSize: 14,
                          fontWeight:
                          FontWeight.bold,
                          fontFamily:
                          'flutterfonts',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_flutter/model/weather_forecast_model.dart';
import 'package:weather_flutter/util/convert_icon.dart';
import 'package:weather_flutter/util/forecase_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel>snapshot, int index){
  var forecastlist = snapshot.data.list;
  var dayOfWeek = "";
  DateTime date = new DateTime.fromMillisecondsSinceEpoch(forecastlist[index].dt * 1000);
  var fullDate = Util.getFormattedDate(date);
  dayOfWeek = fullDate.split(",")[0];

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(dayOfWeek),
      )),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 33,
            backgroundColor: Colors.white,
            child: getWeatherIcon(weatherDescription: forecastlist[index].weather[0].main,
                color: Colors.pinkAccent, size: 45),
          ),
           Column(
             children: [
               Padding(
                 padding: const EdgeInsets.only(left: 8.0),
                 child: Row(
                   children: [
                     Text("${forecastlist[index].temp.min.toStringAsFixed(0)} °F"),
                     Icon(FontAwesomeIcons.solidArrowAltCircleDown, size: 17, color: Colors.white,)
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 8.0),
                 child: Row(
                   children: [
                     Text("${forecastlist[index].temp.max.toStringAsFixed(0)} °F"),
                     Icon(FontAwesomeIcons.solidArrowAltCircleUp, size: 17, color: Colors.white,)
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 8.0),
                 child: Row(
                   children: [
                     Text("Hum: ${forecastlist[index].humidity.toStringAsFixed(0)} %"),
                     //Icon(FontAwesomeIcons.solidGrinBeamSweat, size: 17, color: Colors.white,)
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 8.0),
                 child: Row(
                   children: [
                     Text("Win: ${forecastlist[index].speed.toStringAsFixed(1)} mi/h"),
                     //Icon(FontAwesomeIcons.wind, size: 17, color: Colors.white,)
                   ],
                 ),
               ),


             ],
           ),

        ],
      )
    ],
  );
}
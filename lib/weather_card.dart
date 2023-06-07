import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final weatherData;
  const WeatherCard({super.key, required this.weatherData});
  String toCelcius(double tmp) {
    return tmp.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Latitude: ${weatherData!['lat']} | Longitude: ${weatherData!['lon']}',
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 100,
            child: Image(
                image: NetworkImage(
                    'https://openweathermap.org/img/wn/${weatherData!['current']['weather'][0]['icon']}@2x.png')),
          ),
          Container(
            child: Center(
                child: Text(
              '${toCelcius(weatherData!['current']['temp'] - 273)}°C',
              style: TextStyle(fontSize: 30),
            )),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              '${weatherData!['current']['weather'][0]['description']}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    // color: Colors.blue,

                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      border: Border.all(
                        color: Colors.lightGreen,
                        width: 10,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.air),
                        Text('${weatherData!['current']['wind_speed']}'),
                        Text('wind flow')
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      border: Border.all(
                        color: Colors.lightGreen,
                        width: 10,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(children: [
                      Icon(Icons.water_drop),
                      Text('${weatherData!['current']['humidity']}'),
                      Text('humidity')
                    ]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      border: Border.all(
                        color: Colors.lightGreen,
                        width: 10,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.umbrella),
                        Text('${weatherData['minutely'][0]['precipitation']}%'),
                        Text('Rain Possibility')
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

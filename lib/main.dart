import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http show Client;
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'getlocation.dart';
import 'warning.dart';
import 'weather_card.dart';

void main() {
  runApp(const MyWeatherApp());
}

class MyWeatherApp extends StatefulWidget {
  const MyWeatherApp({super.key});

  @override
  State<MyWeatherApp> createState() => _MyWeatherAppState();
}

class _MyWeatherAppState extends State<MyWeatherApp> {
  Map<String, dynamic>? weatherData;

  bool locationEnabled = false;

  void handleLocationAllowedState(bool value) {
    setState(() {
      locationEnabled = value;
    });
  }

  Future<void> getLocation() async {
    //get location
  }
  Future<void> fetchDataFromApi() async {
    String apiKey = "b65646526636a68703d3aa4e19d4117a";

    String lat = "13.0827";
    String lon = "80.2707";
    var objPos =
        await LocationHelper(handleLocationAllowedState).getCurrentLocation();
    lat = objPos.latitude.toString();
    lon = objPos.longitude.toString();
    print("Position : $objPos");

    String baseUrl =
        "https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&cnt=8&appid=$apiKey";
    try {
      http.Client client = http.Client();
      final response = await client.get(Uri.parse(baseUrl));
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(
            'Response Data ................................................. $data ');
        setState(() {
          weatherData = data;
        });
      }
    } catch (ex) {
      print(ex);
      throw Exception('Response error: ${ex.toString()}');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchDataFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
          child: (weatherData == null && locationEnabled == true)
              ? Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(color: Colors.blue),
                )
              : locationEnabled == false
                  ? Warning(
                      warning_message:
                          'Location is Disabled,please enable and restart app!')
                  : Scaffold(
                      appBar: AppBar(
                        title: Text("Weather"),
                        centerTitle: true,
                        backgroundColor: Colors.black,
                        // leading: Text(
                        //   'Data Loaded by - ${DateTime.now().toString()}',
                        //   style: TextStyle(color: Colors.white),
                        // ),
                      ),
                      body: Padding(
                          padding: EdgeInsets.all(10),
                          child: WeatherCard(weatherData: weatherData!)))),
    );
  }
}

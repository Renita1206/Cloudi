//import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
//import 'package:http/http.dart' as http;

void main() => runApp(Cloudi());

class Cloudi extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cloudi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    getweather();
    super.initState();
  }

  WeatherFactory wf = new WeatherFactory("aef5002fb96136cdd4b39bc9110472b8");
  Weather X;
  getweather() async {
    Weather w = await wf.currentWeatherByCityName("Bangalore");
    setState(() {
      X = w;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cloudi: The Weather App"),
          backgroundColor: Colors.blue[900],
        ),
        body: _list());
  }

  Widget _list() {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          height: 200,
          color: Colors.blue[600],
          child: ListTile(
              title: Icon(Icons.cloud_outlined, size: 100),
              subtitle: Text("Today's Weather Forcast in " + "${X.areaName}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300))),
        ),
        Container(
          height: 50,
          color: Colors.blue[100],
          child: ListTile(
              title: Text('Description'),
              trailing: Text("${X.weatherDescription}")),
        ),
        Container(
          height: 50,
          color: Colors.blue[100],
          child: ListTile(
              title: Text('Temperature'), trailing: Text("${X.temperature}")),
        ),
        Container(
          height: 50,
          color: Colors.blue[100],
          child: ListTile(
              title: Text('Temperature feels like'),
              trailing: Text("${X.tempFeelsLike}")),
        ),
        Container(
          height: 50,
          color: Colors.blue[100],
          child: ListTile(
              title: Text('Windspeed'), trailing: Text("${X.windSpeed}")),
        ),
        Container(
          height: 50,
          color: Colors.blue[100],
          child: ListTile(
              title: Text('Humidity'), trailing: Text("${X.humidity}")),
        ),
        Container(
          height: 50,
          color: Colors.blue[100],
          child: ListTile(
              title: Text('Cloudiness'), trailing: Text("${X.cloudiness}")),
        ),
      ],
    );
  }
}

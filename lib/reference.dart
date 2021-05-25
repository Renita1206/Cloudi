import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:flutter/cupertino.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  void initState() {
    getweather();
    super.initState();
  }

  WeatherFactory wf = new WeatherFactory("aef5002fb96136cdd4b39bc9110472b8");
  Weather mylocation;
  bool loading = true;
  getweather() async {
    Weather w = await wf.currentWeatherByCityName("Bangalore");
    setState(() {
      mylocation = w;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading == true
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Container(
                    color: Colors.red,
                    alignment: Alignment.center,
                    height: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Currently in ${mylocation.areaName}',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        Text('${mylocation.temperature}°',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        Text('${mylocation.weatherDescription}',
                            style: TextStyle(color: Colors.white, fontSize: 20))
                      ],
                    )),
                Expanded(
                  child: Container(
                      color: Colors.white,
                      child: Column(children: [
                        ListTile(
                            leading: Icon(Icons.thermostat_outlined),
                            title: Text('Temperature'),
                            trailing: Text('${mylocation.temperature}')),
                        ListTile(
                            leading: Icon(Icons.cloud),
                            title: Text('Weather'),
                            trailing: Text('${mylocation.weatherDescription}')),
                        ListTile(
                            leading: Icon(Icons.cloud_queue),
                            title: Text('Feels like'),
                            trailing: Text('${mylocation.tempFeelsLike}')),
                        ListTile(
                            leading: Icon(CupertinoIcons.wind),
                            title: Text('Windspeed'),
                            trailing: Text('${mylocation.windSpeed}'))
                      ])),
                )
              ],
            ),
    );
  }
}

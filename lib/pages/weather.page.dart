import 'package:flutter/material.dart';
import 'package:weather_app/pages/weather.detail.page.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String city = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Text('mon menu'),
      ),
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Entrer la ville  :' + city),
      ),
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(hintText: 'Taper une ville'),
                onChanged: (value) {
                  setState(() {
                    this.city = value;
                  });
                },
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WeatherDetailPage(city)));
                },
                color: Colors.deepOrangeAccent,
                textColor: Colors.white,
                child: Text(
                  'Get weather',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

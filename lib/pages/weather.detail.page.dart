import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class WeatherDetailPage extends StatefulWidget {
  String city;
  WeatherDetailPage(this.city);
  @override
  _WeatherDetailPageState createState() => _WeatherDetailPageState();
}

class _WeatherDetailPageState extends State<WeatherDetailPage> {
  var weatherData;
  @override
  void initState() {
    super.initState();
    getData(widget.city);
  }

  getData(String city) {
    //String url ="https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=30e895c3ba9b597ae5a5a340632b30fa";
    //http.get(url).then((resp) {}).catchError((err) {}); old version

    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=30e895c3ba9b597ae5a5a340632b30fa');
    http.get(url).then((resp) {
    
    setState(() {
    this.weatherData = json.decode(resp.body);
    print(this.weatherData);
    });

    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Detail of ${widget.city}'),
        backgroundColor: Colors.deepOrange,
      ),
      body: (weatherData == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount:
                  (weatherData == null ? 0 : weatherData['weather'].length),
              itemBuilder: (context, index) {
                return Card(
   clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.beach_access,color: Colors.blue, size: 36.0,),
                    title:  Text("Time Zone: "+ weatherData['main']['temp'].toString(), style: TextStyle(fontSize:15,color: Colors.deepOrange),),
                    subtitle: Text('Name: '+weatherData['name'].toString()
                    ,
                      style: TextStyle(color:  Colors.blue[900] 
                      
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                    'Etat du ciel   : '+weatherData['weather'][index]['description'].toString()+'\n         Temperature max   : '+weatherData['main']['temp_max'].toString()+'\n         Temperature min  : '+weatherData['main']['temp_max'].toString()+'',
                      style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 18),
                      
                    ),
                    
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.start,
                    children: [
                      FlatButton(
                        textColor: const Color(0xFF6200EE),
                        onPressed: () {
                          
                        },
                        child:  Text("Long : ${weatherData['coord']['lon']}", style: TextStyle(fontSize:15,color: Colors.deepOrange)),
                      ),
                      FlatButton(
                        textColor: const Color(0xFF6200EE),
                        onPressed: () {
                         
                        },
                        child:  Text("Lat : ${weatherData['coord']['lat']}", style: TextStyle(fontSize:15,color: Colors.deepOrange)),
                        
                      ),
                      FlatButton(
                        textColor: const Color(0xFF6200EE),
                        onPressed: () {
                         
                        },
                        child:  Text("Pays : ${weatherData['sys']['country']}", style: TextStyle(fontSize:15,color: Colors.deepOrange)),
                        
                      ),
                    ],
                  ),
                  Container(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('images/'+weatherData['weather'][index]['main'].toString().toLowerCase()+'.png')
                    //${weatherData['weather'][index]['main'].toString().toLowerCase()}
                    //'+weatherData['weather'][index]['main'].toString().toLowerCase()+'

                  )),
                 
                ],
              ),
            ),
          );

              }
              
)
              
              ),
    );
  }
}

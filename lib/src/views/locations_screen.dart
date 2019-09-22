import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';

// state
import 'package:equakes/src/state/equake.dart';

class LocationScreen extends StatefulWidget{
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen>{

   Future<LocationData> _getLocation() async{
    LocationData currentLocation;
    var location = new Location();
    var permission = await location.hasPermission();
    if(!permission){
      var requested = await location.requestPermission();
      if(requested){
        try {
          currentLocation = await location.getLocation();
        } on PlatformException{
          currentLocation = null;
        }   
      }
    } else{
        try {
          currentLocation = await location.getLocation();
        } on PlatformException{
          currentLocation = null;
        }
    }
    return currentLocation;
  }

  @override
  Widget build(BuildContext context){
    return Consumer(
      builder : (context, Equake equake, _) => Scaffold(
        appBar : AppBar(),
        body: Container(
          alignment : Alignment.topCenter,
          child : Padding(
            padding : EdgeInsets.all(8.0),
            child : Column(
              crossAxisAlignment: CrossAxisAlignment.center,                                                           
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height : 250
                ),
                Text(
                    'Epicenter Location',
                    style : TextStyle(
                      fontSize : 36,
                    ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(
                      child : Text(
                        "Auto"
                      ),
                      onPressed: (){
                        _getLocation().then((locationData) {
                          if(locationData != null){
                            print("got here");
                            equake.setLat(locationData.latitude.toDouble());
                            equake.setLong(locationData.longitude.toDouble());
                            equake.setDepth(locationData.altitude.toDouble());
                          // should now confirm what results were
                          } else {
                            showDialog(
                              context : context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Device Location Permissions Error"),
                                );
                              }
                            );
                          }
                        });
                      },
                    ),
                    RaisedButton(
                      child : Text(
                        "Manual"
                      ),
                      onPressed: (){
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Manual Location"),
                              content: Column(
                                children: <Widget>[
                                  Text("Latitude:"),
                                  TextField(
                                    decoration: InputDecoration(labelText: equake.getLat().toString()),
                                    keyboardType: TextInputType.number,
                                    onChanged: (val) {
                                      equake.setLat(double.parse(val));
                                    }
                                  ),
                                  Text("Longitude:"),
                                  TextField(
                                    decoration: InputDecoration(labelText: equake.getLong().toString()),
                                    keyboardType: TextInputType.number,
                                    onChanged: (val) {
                                      equake.setLong(double.parse(val));
                                    }
                                  ),
                                  Text("Depth:"),
                                  TextField(
                                    decoration: InputDecoration(labelText: equake.getDepth().toString()),
                                    keyboardType: TextInputType.number,
                                    onChanged: (val) {
                                      equake.setDepth(double.parse(val));
                                    }
                                  ),
                                ],
                              )
                            );
                          }
                        );
                      },
                    )
                  ]
                ),
                Spacer(),
                DotsIndicator(
                  dotsCount: 2,
                  position: 0
                ),
              ],
            )
          )
        ),
      )
    );
  }
}
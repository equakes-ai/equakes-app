import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';

// state
import 'package:equakes/src/state/equake.dart';

class DemoScreen extends StatefulWidget {
  @override
  _DemoScreenState createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {

  String dropdownValue = "Michoacan";

  sendCall(Equake equake) async {
    Response res;
    Dio dio = new Dio();
    res = await dio.post("/endpoint", data : {"lat":equake.getLat(), "long":equake.getLong(), "depth":equake.getDepth(), "magnitude":equake.getMagnitude(), "radius":equake.getRadius()});
  }

  @override
  Widget build(BuildContext context){
    return Consumer(
      builder : (context, Equake equake, _) => Scaffold(
        body : Container(
          alignment: Alignment.center,
          child: Padding(
            padding : EdgeInsets.all(8.0),
            child : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Demo Cities",
                  style: TextStyle(
                    fontSize: 36,
                  ),
                ),
                DropdownButton<String>(
                  value : dropdownValue,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  onChanged: (String newValue){
                    setState((){
                      dropdownValue = newValue;
                      if(dropdownValue == "Michoacan"){
                        equake.modifyEquake(18.18, -102.57, 17, 8.01);
                      } else if(dropdownValue == "Tonankai"){
                        equake.modifyEquake(33.80, 136.62, 30, 8.1);
                      } else if(dropdownValue == "Fukui"){
                        equake.modifyEquake(36.427, 136.188, 10.14, 6.65);
                      } else if(dropdownValue == "Chi-Chi"){
                        equake.modifyEquake(23.869, 120.84, 7, 7.69);
                      } else if(dropdownValue == "Maule"){
                        equake.modifyEquake(-35.918, -72.886, 20.12, 8.8);
                      } else if(dropdownValue == "Khash"){
                        equake.modifyEquake(28.1134, 62.0480, 83.36, 7.8);
                      } else if(dropdownValue == "Gorkha"){
                        equake.modifyEquake(28.147, 84.7080, 15, 7.9);
                      } else if(dropdownValue == "Norcia"){
                        equake.modifyEquake(42.84, 13.08, 9.5, 6.5);
                      } else if(dropdownValue == "Gifu-ken-chubu"){
                        equake.modifyEquake(35.48, 137.05, 2, 6.43);
                      } else if(dropdownValue == "Elmore Ranch"){
                        equake.modifyEquake(33.0833, -115.7960, 10, 6.52);
                      }
                      sendCall(equake);     
                      
                    });
                  },
                  items : <String>['Michoacan', 'Tonankai', 'Fukui', 'Chi-Chi', 'Maule', 'Khash', 'Gorkha', 'Norcia', 'Gifu-ken-chubu', 'Elmore Ranch']
                  .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value : value,
                      child : Text(value)
                    );
                  }).toList(),
                )
              ],
            )
          )
        ),
      )
    );
  }
}
import 'package:equakes/src/state/map.dart';
import 'package:equakes/src/views/demo_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// state
import 'package:equakes/src/state/equake.dart';
import 'package:equakes/src/state/map.dart';

// views
import 'package:equakes/src/views/welcome_screen.dart';
import 'package:equakes/src/views/locations_screen.dart';
import 'package:equakes/src/views/demo_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{

  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Equake>(builder : (_) => Equake(0, 0, 0, 5, 150)),
        ChangeNotifierProvider<GMap>(builder : (_) => GMap()),
      ],
      child : MaterialApp(
        title : 'equakes',
        theme : ThemeData(
          brightness : Brightness.dark,
          primarySwatch : Colors.blue, 
        ),
        routes : {
          '/' : (context) => WelcomeScreen(),
          '/location' : (context) => LocationScreen(),
          '/demo' : (context) => DemoScreen(),
        }
      )
    );
  }

}
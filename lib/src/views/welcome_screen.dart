import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget{
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>{
  @override
  void initState(){
    super.initState();
  }

  bool _visible = false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body : Container(
        alignment: Alignment.center,
        child : Padding(
          padding : EdgeInsets.all(8.0),
          child : AnimatedOpacity(
            opacity : _visible ? 0 : 1.0,
            duration : Duration(milliseconds : 500),
            child : ConstrainedBox(
              constraints : const BoxConstraints.expand(),
              child : Column(
                crossAxisAlignment : CrossAxisAlignment.start,
                mainAxisAlignment : MainAxisAlignment.center,
                children: [
                  _Title(),
                ]
              )
            )
          )
        )
      )
    );
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Align(
        alignment: Alignment.center,
        child : Column(
          children: [
            Text(
              'equakes',
              style : TextStyle(
                fontSize : 36,
              )
            ),
            SizedBox(
              height : 12,
            ),
            Text(
              'Predicts risk of aftershocks in your area.'
            ),
            SizedBox(
              height : 20,
            ),
            RaisedButton(
              child : Text(
                "Check"
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/location');
              },
            ),
            RaisedButton(
              child : Text(
                "Demo"
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/demo');
              },
            ),
          ]
        )
    );
  }
}

class _TapNotify extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Expanded(
        child: Align(
          alignment : FractionalOffset.bottomCenter,
          child : Text(
            "TAP ANYWHERE TO CONTINUE",
            style : TextStyle(
              // letterSpacing: 1.3,
              // heavy on computation
              fontSize: 18,
            )
          )
        ),
    );
  }
}
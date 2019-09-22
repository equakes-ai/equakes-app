import 'package:flutter/material.dart';

// shared state
import 'package:equakes/src/state/point.dart';

class GMap with ChangeNotifier{
  List<Point> points;

  GMap(){
    points = new List<Point>();
  }

  addPoint(Point p){
    points.add(p);
  }

  getPoints() => points;
}
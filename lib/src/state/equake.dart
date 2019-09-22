import 'package:flutter/material.dart';

class Equake with ChangeNotifier {
  double _lat;
  double _long;
  double _depth;
  double _magnitude;
  double _radius;

  Equake(this._lat, this._long, this._depth, this._magnitude, this._radius);

  // getters
  getLat() => _lat;
  getLong() => _long;
  getDepth() => _depth;
  getMagnitude() => _magnitude;
  getRadius() => _radius;

  // setters
  setLat(double lat) => _lat = lat;
  setLong(double long) => _long = long;
  setDepth(double depth) => _depth = depth;
  setMagnitude(double magnitude) => _magnitude = magnitude;
  setRadius(double radius) => _radius = radius; 
  modifyEquake(double lat, double long, double depth, double magnitude){
    _lat = lat;
    _long = long;
    _depth = depth;
    _magnitude = magnitude;
  }

}
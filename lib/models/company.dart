import 'package:flutter/material.dart';

class Company with ChangeNotifier {
  final String id;
  final String name;
  final String logo;
  final double latitude;
  final double longitude;
  Company({this.id, this.name, this.logo, this.latitude, this.longitude});
}

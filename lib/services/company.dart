import 'package:flutter/material.dart';
import 'package:injazTech/models/company.dart';

class CompanyHandler with ChangeNotifier {
  List<Company> _companies = [
    Company(
      id: 'co-1',
      name: 'display-name-1',
      logo:
          'https://www.kindpng.com/picc/m/257-2576933_transparent-fake-png-dummy-company-logo-png-png.png',
      latitude: 30.033333,
      longitude: 31.233334,
    ),
    Company(
      id: 'co-2',
      name: 'display-name-2',
      logo: 'https://www.logologo.com/logos/cube-logo.jpg',
      latitude: 31.192560,
      longitude: 31.520460,
    ),
    Company(
      id: 'co-3',
      name: 'display-name-3',
      logo: 'https://www.logologo.com/logos/rainbow-compass-logo.jpg',
      latitude: 29.952654,
      longitude: 30.921919,
    ),
  ];
  List<Company> get companies {
    return [..._companies];
  }

  Company findById(String id) {
    return _companies.firstWhere((company) => company.id == id);
  }
}

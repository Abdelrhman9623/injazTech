import 'package:flutter/material.dart';

class RequestData with ChangeNotifier {
  final String id;
  final String name;
  final String userEmail;
  final String companyLogo;
  final String requsteDate;
  final PlaceLocation location;
  bool status;
  RequestData(
      {this.id,
      this.name,
      this.userEmail,
      this.companyLogo,
      this.requsteDate,
      this.location,
      this.status = false});
}

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String address;

  const PlaceLocation({
    @required this.latitude,
    @required this.longitude,
    this.address,
  });
}

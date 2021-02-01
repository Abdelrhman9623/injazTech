import 'package:flutter/material.dart';
import 'package:injazTech/models/requestData.dart';

class RequasteHandler with ChangeNotifier {
  List<RequestData> _items = [];
  List<RequestData> get requstes {
    return [..._items];
  }

  Future<void> addRequste(String name, String logo, String emial,
      String requasteDate, double lat, double long) async {
    final newRequest = RequestData(
        id: DateTime.now().toString(),
        name: name,
        companyLogo: logo,
        userEmail: emial,
        requsteDate: requasteDate,
        location: PlaceLocation(latitude: lat, longitude: long));
    _items.add(newRequest);
    notifyListeners();
  }

  RequestData findById(String id) {
    return _items.firstWhere((item) => item.id == id);
  }
}

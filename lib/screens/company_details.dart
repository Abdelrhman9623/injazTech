import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injazTech/services/company.dart';
import 'package:injazTech/services/request.dart';
import 'package:provider/provider.dart';
import 'package:date_time_picker/date_time_picker.dart';

class CompayDetails extends StatefulWidget {
  static const routeName = '/company_details';

  @override
  _CompayDetailsState createState() => _CompayDetailsState();
}

class _CompayDetailsState extends State<CompayDetails> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _isLoading = false;
  var _requsteData = {
    "name": "",
    "email": "",
    "date": '',
  };

  void makeRequste() async {
    final companyId = ModalRoute.of(context).settings.arguments as String;
    final items =
        Provider.of<CompanyHandler>(context, listen: false).findById(companyId);
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    try {
      await Provider.of<RequasteHandler>(context, listen: false).addRequste(
          items.name,
          items.logo,
          _requsteData['email'],
          _requsteData['date'],
          items.latitude,
          items.longitude);
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        backgroundColor: Color(0xffd89216),
        content: Text('you just add visit request'),
      ));
    } catch (e) {
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    final companyId = ModalRoute.of(context).settings.arguments as String;
    final items =
        Provider.of<CompanyHandler>(context, listen: false).findById(companyId);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xff374045),
      appBar: AppBar(
        backgroundColor: Color(0xffd89216),
        title: Text(items.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(30.033333, 31.233334), zoom: 9),
                markers: {
                  Marker(
                      markerId: MarkerId(items.id),
                      position: LatLng(items.latitude, items.longitude)),
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Complet This Form To vist us: ',
              style: TextStyle(
                  color: Color(0xffe1d89f), fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    TextFormField(
                      autocorrect: false,
                      readOnly: true,
                      enabled: false,
                      decoration: InputDecoration(
                          hintText: items.name,
                          hintStyle: TextStyle(color: Colors.white)),
                    ),
                    TextFormField(
                      autocorrect: false,
                      decoration: InputDecoration(
                          hintText: 'E-mail',
                          hintStyle: TextStyle(color: Colors.white)),
                      // ignore: missing_return
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'requird *';
                        }
                      },
                      onSaved: (val) {
                        _requsteData['email'] = val.trim();
                      },
                    ),
                    DateTimePicker(
                      initialValue: '',
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                      dateLabelText: 'Date',
                      onChanged: (val) => print(val),
                      // ignore: missing_return
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'requird';
                        }
                      },
                      onSaved: (val) {
                        _requsteData['date'] = val.toString();
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: FlatButton(
                        minWidth: 150,
                        color: Color(0xff2c061f),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            'Submit',
                            style: TextStyle(color: Color(0xffd89216)),
                          ),
                        ),
                        onPressed: _isLoading ? null : makeRequste,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

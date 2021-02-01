import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injazTech/screens/chat_Screen.dart';
import 'package:injazTech/services/company.dart';
import 'package:injazTech/services/request.dart';
import 'package:provider/provider.dart';
import 'package:date_time_picker/date_time_picker.dart';

class RequesteDetails extends StatefulWidget {
  final bool isCustomer;
  RequesteDetails({this.isCustomer = false});
  static const routeName = '/request_details';

  @override
  _RequesteDetailsState createState() => _RequesteDetailsState();
}

class _RequesteDetailsState extends State<RequesteDetails> {
  @override
  Widget build(BuildContext context) {
    final requesteId = ModalRoute.of(context).settings.arguments as String;
    final items = Provider.of<RequasteHandler>(context, listen: false)
        .findById(requesteId);
    return Scaffold(
      backgroundColor: Color(0xff374045),
      appBar: AppBar(
        backgroundColor: Color(0xffd89216),
        title: Text(items.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(
                        items.location.latitude, items.location.longitude),
                    zoom: 9),
                markers: {
                  Marker(
                    markerId: MarkerId(items.id),
                    position: LatLng(
                        items.location.latitude, items.location.longitude),
                  )
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Date: ${items.requsteDate}',
                style: TextStyle(color: Colors.white),
              ),
            ),
            FlatButton(
              child: Text(
                items.status ? 'UnderProcess' : 'pending',
                style: TextStyle(
                    color: items.status ? Colors.white : Colors.amber),
              ),
              onPressed: widget.isCustomer
                  ? null
                  : () {
                      setState(() {
                        items.status = !items.status;
                      });
                    },
            ),
          ],
        ),
      ),
      floatingActionButton: widget.isCustomer
          ? Container()
          : FloatingActionButton(
              child: Icon(Icons.chat),
              onPressed: () =>
                  Navigator.of(context).pushNamed(ChatScreen.routeName),
            ),
    );
  }
}

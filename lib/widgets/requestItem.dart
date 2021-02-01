import 'package:flutter/material.dart';
import 'package:injazTech/models/requestData.dart';
import 'package:injazTech/screens/requeste_details.dart';
import 'package:provider/provider.dart';

class RequsteItems extends StatelessWidget {
  final bool isCustomer;
  RequsteItems({this.isCustomer = false});
  @override
  Widget build(BuildContext context) {
    final requste = Provider.of<RequestData>(context);
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              settings: RouteSettings(arguments: requste.id),
              builder: (context) => RequesteDetails(
                    isCustomer: isCustomer,
                  ))),
      child: Card(
        child: Stack(
          children: [
            FadeInImage(
              placeholder: AssetImage('assets/images/logo.png'),
              image: NetworkImage(requste.companyLogo),
              fit: BoxFit.cover,
              // height: 130,
            ),
            Positioned.fill(
              child: Container(
                  alignment: Alignment.center,
                  color: Colors.black87.withOpacity(0.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        requste.userEmail.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xffe1d89f),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        requste.requsteDate.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xffd89216),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}

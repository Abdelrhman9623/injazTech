import 'package:flutter/material.dart';
import 'package:injazTech/models/company.dart';
import 'package:injazTech/screens/company_details.dart';
import 'package:provider/provider.dart';

class ComapniesIteme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final company = Provider.of<Company>(context);
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(CompayDetails.routeName, arguments: company.id),
      child: Card(
        child: Stack(
          children: [
            FadeInImage(
              placeholder: AssetImage('assets/images/logo.png'),
              image: NetworkImage(company.logo),
              fit: BoxFit.cover,
              height: 150,
            ),
            Positioned.fill(
              child: Container(
                  alignment: Alignment.center,
                  color: Colors.black87.withOpacity(0.5),
                  child: Text(
                    company.name.toUpperCase(),
                    style: TextStyle(
                        color: Color(0xffe1d89f),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

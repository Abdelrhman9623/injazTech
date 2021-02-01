import 'package:flutter/material.dart';
import 'package:injazTech/services/request.dart';
import 'package:injazTech/widgets/requestItem.dart';
import 'package:provider/provider.dart';

class CompanyWidget extends StatefulWidget {
  @override
  _CompanyWidgetState createState() => _CompanyWidgetState();
}

class _CompanyWidgetState extends State<CompanyWidget> {
  @override
  Widget build(BuildContext context) {
    final requste = Provider.of<RequasteHandler>(context, listen: false);
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text('Hello, You should handle what users ask for, '),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: requste.requstes.length,
            itemBuilder: (context, i) => ChangeNotifierProvider.value(
              value: requste.requstes[i],
              child: RequsteItems(),
            ),
          ),
        ],
      ),
    );
  }
}

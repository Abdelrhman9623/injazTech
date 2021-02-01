import 'package:flutter/material.dart';
import 'package:injazTech/services/request.dart';
import 'package:injazTech/widgets/requestItem.dart';
import 'package:provider/provider.dart';

class UserRequeste extends StatelessWidget {
  static const routeName = '/all-requeste';
  @override
  Widget build(BuildContext context) {
    final requste = Provider.of<RequasteHandler>(context, listen: false);
    return Scaffold(
      backgroundColor: Color(0xff374045),
      appBar: AppBar(
        backgroundColor: Color(0xffd89216),
        title: Text('All Requests'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: requste.requstes.length,
        itemBuilder: (context, i) => ChangeNotifierProvider.value(
          value: requste.requstes[i],
          child: RequsteItems(
            isCustomer: true,
          ),
        ),
      ),
    );
  }
}

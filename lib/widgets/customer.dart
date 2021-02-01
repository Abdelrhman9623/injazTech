import 'package:flutter/material.dart';
import 'package:injazTech/services/auth/auth.dart';
import 'package:injazTech/services/company.dart';
import 'package:injazTech/widgets/companiesItem.dart';
import 'package:provider/provider.dart';

class CustomerWidget extends StatefulWidget {
  final String email;
  CustomerWidget({this.email});

  @override
  _CustomerWidgetState createState() => _CustomerWidgetState();
}

class _CustomerWidgetState extends State<CustomerWidget> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthHandler>(context, listen: false)
        .findeUserByemail(widget.email);
    final companies = Provider.of<CompanyHandler>(context, listen: false);
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: 'Hello ${user.name} ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xffd89216))),
                TextSpan(
                    text:
                        'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s,')
              ]),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: companies.companies.length,
              itemBuilder: (context, i) {
                return ChangeNotifierProvider.value(
                  value: companies.companies[i],
                  child: ComapniesIteme(),
                );
              }),
        ],
      ),
    );
  }
}

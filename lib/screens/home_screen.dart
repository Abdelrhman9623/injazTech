import 'package:flutter/material.dart';
import 'package:injazTech/screens/auth/auth_screen.dart';
import 'package:injazTech/screens/user_requeste_screen.dart';
import 'package:injazTech/widgets/company.dart';
import 'package:injazTech/widgets/customer.dart';

class HomeScreen extends StatelessWidget {
  final String email;
  HomeScreen({this.email});
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    final type = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      backgroundColor: Color(0xff374045),
      appBar: AppBar(
        backgroundColor: Color(0xffd89216),
        elevation: 0,
        leading: type != 'company'
            ? IconButton(
                icon: Icon(
                  Icons.all_inbox_outlined,
                ),
                onPressed: () =>
                    Navigator.of(context).pushNamed(UserRequeste.routeName))
            : Container(),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => Navigator.of(context)
                .pushReplacementNamed(AuthScreen.routeName),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: type == 'company'
            ? CompanyWidget()
            : CustomerWidget(
                email: email,
              ),
      ),
    );
  }
}

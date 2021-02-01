import 'package:flutter/material.dart';
import 'package:injazTech/helper/htt_ex.dart';
import 'package:injazTech/screens/home_screen.dart';
import 'package:injazTech/services/auth/auth.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = '/login';
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var isCompany = false;
  var isCustomer = false;
  var isNotSelect = false;
  var _authData = {'email': '', 'password': ''};

  selectIsCustomer(bool val) {
    setState(() {
      isCustomer = val;
      isNotSelect = val;
      isCompany = false;
    });
  }

  selectIsCompany(bool val) {
    setState(() {
      isCustomer = false;
      isNotSelect = val;
      isCompany = val;
    });
  }

  void submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    if (_authData['email'] == 'am@gmail.com' ||
        _authData['email'] == 'ib@gmail.com' ||
        _authData['email'] == 'ab@gmail.com' ||
        _authData['email'] == 'mu@gmail.com') {
      try {
        Navigator.push(
            context,
            MaterialPageRoute(
                settings: RouteSettings(
                  arguments: isCompany ? 'company' : 'customer',
                ),
                builder: (context) => HomeScreen(
                      email: _authData['email'],
                    )));
      } catch (error) {
        throw error;
      }
    } else {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        backgroundColor: Theme.of(context).errorColor,
        content: Text(
          'UNAUTHORIZED',
          style: TextStyle(color: Colors.white),
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xff374045),
      appBar: AppBar(
        backgroundColor: Color(0xffd89216),
        elevation: 0,
        leading: Container(),
        title: Text('Welcome'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Wrap(
          alignment: WrapAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Image.asset(
                'assets/images/logo.png',
                // width: 120,
                height: 200,
              ),
            ),
            Card(
              color: Color(0xffe1d89f),
              child: Form(
                key: _formKey,
                child: Column(
                  // padding: const EdgeInsets.all(10),
                  // shrinkWrap: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                          hintText: 'Enter yor email ex: exmple@exmple.com',
                        ),
                        // ignore: missing_return
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'entwr';
                          }
                        },
                        onSaved: (val) {
                          _authData['email'] = val;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        enableSuggestions: false,
                        autocorrect: false,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                        ),
                        // ignore: missing_return
                        validator: (val) {
                          if (val.length < 6) {
                            return 'paasss';
                          }
                        },
                        onSaved: (val) {
                          _authData['password'] = val.trim();
                        },
                      ),
                    ),
                    Wrap(
                      alignment: WrapAlignment.center,
                      direction: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: 164,
                          child: CheckboxListTile(
                            dense: true,
                            controlAffinity: ListTileControlAffinity.leading,
                            value: isCustomer,
                            title: Text('Customer'),
                            onChanged: (val) => selectIsCustomer(val),
                          ),
                        ),
                        SizedBox(
                          width: 168,
                          child: CheckboxListTile(
                            dense: true,
                            controlAffinity: ListTileControlAffinity.leading,
                            value: isCompany,
                            title: Text('Comapany'),
                            onChanged: (val) => selectIsCompany(val),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 250,
              margin: EdgeInsets.only(top: 50),
              padding: EdgeInsets.symmetric(horizontal: 50),
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
                onPressed: isNotSelect ? submit : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

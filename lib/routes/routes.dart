import 'package:flutter/material.dart';
import 'package:injazTech/screens/auth/auth_screen.dart';
import 'package:injazTech/screens/chat_Screen.dart';
import 'package:injazTech/screens/company_details.dart';
import 'package:injazTech/screens/home_screen.dart';
import 'package:injazTech/screens/requeste_details.dart';
import 'package:injazTech/screens/user_requeste_screen.dart';

var customRoutes = <String, WidgetBuilder>{
  AuthScreen.routeName: (context) => AuthScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  CompayDetails.routeName: (context) => CompayDetails(),
  RequesteDetails.routeName: (context) => RequesteDetails(),
  UserRequeste.routeName: (context) => UserRequeste(),
  ChatScreen.routeName: (context) => ChatScreen(),
};

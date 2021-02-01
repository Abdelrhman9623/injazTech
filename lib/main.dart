import 'package:flutter/material.dart';
import 'package:injazTech/routes/routes.dart';
import 'package:injazTech/screens/auth/auth_screen.dart';
import 'package:injazTech/services/auth/auth.dart';
import 'package:injazTech/services/company.dart';
import 'package:injazTech/services/request.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthHandler>(
          create: (_) => AuthHandler(),
        ),
        ChangeNotifierProvider<CompanyHandler>(
          create: (_) => CompanyHandler(),
        ),
        ChangeNotifierProvider<RequasteHandler>(
          create: (_) => RequasteHandler(),
        ),
      ],
      child: MaterialApp(
        title: 'INJAZTECH',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AuthScreen(),
        routes: customRoutes,
      ),
    );
  }
}

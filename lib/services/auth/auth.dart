import 'package:flutter/material.dart';
import 'package:injazTech/helper/htt_ex.dart';
import 'package:injazTech/models/user.dart';

class AuthHandler extends ChangeNotifier {
  List<Users> _users = [
    Users(id: 'user-1', name: 'Ahmed Mohammed', email: 'am@gmail.com'),
    Users(id: 'user-2', name: 'Ibrahim Mohammed', email: 'ib@gmail.com'),
    Users(id: 'user-3', name: 'Abdelrhman Mohammed', email: 'ab@gmail.com'),
    Users(id: 'user-4', name: 'Mustafa Mohammed', email: 'mu@gmail.com'),
  ];

  List<Users> get users {
    return [..._users];
  }

  Users findeUserByemail(String email) {
    return _users.firstWhere((user) => user.email == email);
  }
}

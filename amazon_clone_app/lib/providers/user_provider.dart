import 'package:amazon_clone_app/models/user.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
      id: '',
      name: '',
      email: '',
      password: '',
      address: '',
      type: '',
      token: '');

  User get user {
    return _user;
  }

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
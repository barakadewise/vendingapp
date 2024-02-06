import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendingapp/redux/actions.dart';
import 'package:vendingapp/redux/app_state.dart';

class User {
  final String id, fullName, email, cellphone;
  // final int status;

  User(this.id, this.fullName, this.email, this.cellphone);

  static void logout(BuildContext context) async {
    StoreProvider.of<AppState>(context)
        .dispatch(UpdateAuthenticatedAction(false));
    StoreProvider.of<AppState>(context).dispatch(UpdateUserAction(null));
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    // todo unregister notifications to null user
    localStorage.remove('token');
    localStorage.remove('user');
    localStorage.remove('notifications');
  }

  static void login(BuildContext context, String token, dynamic user) async {
    StoreProvider.of<AppState>(context)
        .dispatch(UpdateAuthenticatedAction(true));
    StoreProvider.of<AppState>(context).dispatch(UpdateUserAction(User(
        user['_id'].toString(),
        '${user['first_name']} ${user['last_name']}}',
        user['email'],
        user['mobileNo'])));
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    localStorage.setString('token', token);
    localStorage.setString('user', json.encode(user));
  }
}

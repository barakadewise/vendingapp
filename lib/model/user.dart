import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendingapp/redux/actions.dart';
import 'package:vendingapp/redux/app_state.dart';

class User {
  final String id, fullName, email, cellphone, nationalId, address;
  // final int status;

  User(this.id, this.fullName, this.email, this.cellphone, this.nationalId,
      this.address);

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
}

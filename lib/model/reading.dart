import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendingapp/redux/actions.dart';
import 'package:vendingapp/redux/app_state.dart';
import 'package:vendingapp/utils/api/api.dart';
import 'package:web_socket_channel/io.dart';

class Reading {
  String totalVolume, balance;

  Reading(this.totalVolume, this.balance);

  static getDeviceReading(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var user = sharedPreferences.getString('user');
    if (user != null) {
      var userData = json.decode(user);
      var res = CallApi().authenticatedGetRequest(
          'api/v1/device-info?device_no=${userData["device_no"]}');
      if (res != null) {
        // TODO: update redux state accordingly

        StoreProvider.of<AppState>(context).dispatch(UpdateReadingAction(null));
      }
    }
  }

  static void readingWebSocket(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var user = sharedPreferences.getString('user');
    if (user != null) {
      var userData = json.decode(user);
      final channel = IOWebSocketChannel.connect(
          '${CallApi.socketURL}ws/user-data/${userData['id']}');

      channel.stream.listen((message) {
        print(message);
        var data = json.decode(message)['reading'];
        StoreProvider.of<AppState>(context)
            .dispatch(UpdateReadingAction(Reading(
          data['total_volume'].toString(),
          data['balance'].toString(),
        )));
        // store.dispatch(WebSocketMessageReceivedAction(message));
      });
    }
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendingapp/model/transactions.dart';
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
          '${CallApi.socketURL}ws/user-data/${userData['account']['accountNo']}');

      channel.stream.listen((message) {
        var data = json.decode(message);
        print(data);
        var account = data['account'];
        StoreProvider.of<AppState>(context)
            .dispatch(UpdateReadingAction(Reading(
          account['consumed_litres'].toString(),
          account['current_balance'].toString(),
        )));

        var trans = data['trans'];
        List<Transaction> transactions = [];
        for (var tran in trans) {
          transactions.add(Transaction(
              tran['_id'], tran['amount'], tran['type'], tran['at']));
        }

        StoreProvider.of<AppState>(context)
            .dispatch(UpdateTransactionsAction(transactions));
      });
    }
  }
}

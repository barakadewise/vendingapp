import 'package:vendingapp/model/reading.dart';
import 'package:vendingapp/model/transactions.dart';
import 'package:vendingapp/model/user.dart';

class AppState {
  bool authenticated = false;
  User? user;
  Reading? reading;
  List<Transaction> transactions;

  AppState(
      {this.authenticated = false,
      this.user,
      this.reading,
      this.transactions = const []});
}

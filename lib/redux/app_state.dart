import 'package:vendingapp/model/reading.dart';
import 'package:vendingapp/model/user.dart';
// import 'package:gnmcargo_app/models/user_notification.dart';

class AppState {
  bool authenticated = false;
  User? user;
  Reading? reading;
  // List<UserNotification> notifications;

  AppState({this.authenticated = false, this.user, this.reading});
}

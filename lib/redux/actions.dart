import 'package:vendingapp/model/reading.dart';
import 'package:vendingapp/model/user.dart';

class UpdateAuthenticatedAction {
  final bool authenticated;

  UpdateAuthenticatedAction(this.authenticated);
}

class UpdateUserAction {
  final User? user;

  UpdateUserAction(this.user);
}

class UpdateReadingAction {
  final Reading? reading;

  UpdateReadingAction(this.reading);
}

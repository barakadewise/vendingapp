import 'package:redux/redux.dart';
import 'package:vendingapp/model/reading.dart';
import 'package:vendingapp/redux/app_state.dart';
import 'package:vendingapp/redux/reducer.dart';

Store<AppState> store = Store<AppState>(appReDucer,
    initialState: AppState(authenticated: false, reading: Reading('0', '0')));

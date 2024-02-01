import 'package:vendingapp/redux/actions.dart';
import 'package:vendingapp/redux/app_state.dart';

AppState appReDucer(AppState state, dynamic action) {
  if (action is UpdateAuthenticatedAction) {
    return AppState(
      authenticated: action.authenticated,
      user: state.user,
    );
  } else if (action is UpdateUserAction) {
    return AppState(
      authenticated: state.authenticated,
      user: action.user,
    );
  } else if (action is UpdateReadingAction) {
    return AppState(
        authenticated: state.authenticated,
        reading: action.reading,
        user: state.user);
  }

  return state;
}

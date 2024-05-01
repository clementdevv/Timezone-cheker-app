import 'package:intl/intl.dart';
import 'package:toy_shop_app/fetch_time_action.dart';

class AppState {
  final String _location;
  final String _time;

  String get location => _location;
  String get time => _time;

  AppState(this._location, this._time);

  AppState.initialState()
      : _location = "Nairobi, Kenya",
        _time = DateFormat('h:mma').format(DateTime.now()).toString();
}

AppState reducer(AppState prev, dynamic action) {
  if (action is FetchTimeAction) {
    return AppState(action.location, action.time);
  } else {
    return prev;
  }
}

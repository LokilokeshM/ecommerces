import 'package:shared_preferences/shared_preferences.dart';

class Global {
  final SharedPreferences _prefs;

  static late final Global _instance;

  static Global getInstance() => _instance;

  static Future<void> init(SharedPreferences prefs) async {
    _instance = Global._(prefs);
  }

  Global._(this._prefs);

  String? _token;

  String get token {
    _token = _prefs.getString("token") ?? "";
    return _token ?? "";
  }

  set token(String value) {
    _token = value;
    _prefs.setString("token", value);
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class Shared_preference {
  Shared_preference._();
  static Shared_preference shared_preference = Shared_preference._();

  /// login check
  void login() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('login', true);
  }

  ///read login check
  Future<bool?> readLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('login');
  }

  /// change login status
  void changeLogin({required bool value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('login', value);
  }

  /// save registration data
  void registration({required String email, required String password}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
    prefs.setString('password', password);
  }

  /// read email
  Future<String?> readEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('email');
  }

  /// read password
  Future<String?> readPassword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('password');
  }
}

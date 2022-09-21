import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Session {
  static saveUser(Map user) async {
    // Membatasi hak akses fungsi/ atribut
    SharedPreferences pref = await SharedPreferences.getInstance();
    String userString = jsonEncode(user);
    // Untuk mengubah data lama dengan data baru
    bool success = await pref.setString('user', userString);
    print('Session - saveUser');
    print(success);
  }
}

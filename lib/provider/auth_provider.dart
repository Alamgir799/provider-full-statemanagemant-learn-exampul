import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  setLoading(value) {
    _loading = value;
    notifyListeners();
  }

  void Login(email, password) async {
    setLoading(true);
    try {
      var response =
          await http.post(Uri.parse("https://reqres.in/api/login"), body: {
        "email": email,
        "password": password,
      });
      if (response.statusCode == 200) {
        print("success");
        setLoading(false);
      } else {
        print("failed");
        setLoading(false);
      }
    } catch (e) {
      setLoading(false);
      print(e.toString());
    }
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseApi {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString("accessToken") == null) {
      Fluttertoast.showToast(msg: "You need to login first");
      navigatorKey.currentState!.popUntil(ModalRoute.withName('/login'));
      throw Exception("Error");
    } else {
      return prefs.getString("accessToken")!;
    }
  }
}

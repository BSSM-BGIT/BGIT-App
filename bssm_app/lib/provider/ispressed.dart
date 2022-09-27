import 'package:flutter/material.dart';

class Pressed extends ChangeNotifier {
  // ChangeNotifier를 extends한다.
  bool _bsmispressed = false;
  bool _githubispressed = false;
  bool _baekjoonispressed = false;
  String _accessToken = "";

  String get accessToken => _accessToken;
  bool get bsmispressed => _bsmispressed;
  bool get githubispressed => _githubispressed;

  void bsmchange() {
    _bsmispressed = true;
    print("실행됨");
    notifyListeners();
  }

  void baekjoonchange() {
    _bsmispressed = true;
    print("실행됨");
    notifyListeners();
  }

  void githubchange() {
    _githubispressed = true;
    notifyListeners();
  }

  void inputaccesstoken(String access) {
    print("access = $access");

    _accessToken = access;
    print("accessToken = $accessToken");
    notifyListeners();
  }
}

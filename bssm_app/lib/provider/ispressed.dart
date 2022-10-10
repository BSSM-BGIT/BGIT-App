// ignore_for_file: avoid_print

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
  bool get baekjoonispressed => _baekjoonispressed;

  void bsmchange() {
    _bsmispressed = true;
    notifyListeners();
  }

  void baekjoonchange() {
    _bsmispressed = true;
    notifyListeners();
  }

  void githubchange() {
    _githubispressed = true;
    notifyListeners();
  }

  void inputaccesstoken(String access) {
    print("access = $access");

    _accessToken = access;
    // ignore: avoid_print
    print("accessToken = $accessToken");
    notifyListeners();
  }
}

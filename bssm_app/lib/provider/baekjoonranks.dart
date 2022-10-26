import 'package:bssm_app/model/blist.dart';
import 'package:flutter/material.dart';

class BaekRanks extends ChangeNotifier {
  // ChangeNotifier를 extends한다.
  final List<BaekjoonRanklist> _baekList = <BaekjoonRanklist>[];

  List<BaekjoonRanklist> get baekList => _baekList;

  void add(int rank, String profile, String userName, String name, String tier,
      int exp, int maxrating) {
    baekList.add(
        BaekjoonRanklist(rank, profile, userName, name, tier, exp, maxrating));
    notifyListeners();
  }

  void clearly() {
    baekList.clear();
    notifyListeners();  
  }
}

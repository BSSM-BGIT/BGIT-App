import 'package:bssm_app/model/glist.dart';
import 'package:flutter/material.dart';

class GitRanks extends ChangeNotifier {
  // ChangeNotifier를 extends한다.
  final List<GitRanklist> _gitList = <GitRanklist>[];

  List<GitRanklist> get gitList => _gitList;

  void add(int rank, String profile, String userName, String name, int commit, bool isnull) {
    gitList.add(GitRanklist(rank, profile, userName, name, commit, isnull));
    notifyListeners();
  }
}
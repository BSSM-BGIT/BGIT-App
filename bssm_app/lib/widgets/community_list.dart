import 'package:bssm_app/model/clist.dart';
import 'package:flutter/material.dart';

class CommunityList extends StatefulWidget {
  const CommunityList({super.key});

  @override
  State<CommunityList> createState() => _CommunityListState();
}

class _CommunityListState extends State<CommunityList> {
  List<Communitylist> community = <Communitylist>[];
  int a = 16;
  int minutes = 1;
  @override
  void initState() {
    super.initState();

    for (int i = 1; i <= 15; i++) {
      community.add(Communitylist("title$i", "$i번째 내용입니다", a, a, minutes));
      a = a - 1;
      minutes += 1;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      
    );
  }
}
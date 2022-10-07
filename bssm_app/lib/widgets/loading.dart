import 'package:bssm_app/common/common.dart';
import 'package:bssm_app/model/glist.dart';
import 'package:bssm_app/provider/baekjoonranks.dart';
import 'package:bssm_app/provider/githubranks.dart';
import 'package:bssm_app/screens/bottombar/bottom.dart';
import 'package:bssm_app/screens/bottombar/rank.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool finish = false;
  var ranks1;
  var ranks2;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ranks1 = Provider.of<GitRanks>(context, listen: false);
      ranks2 = Provider.of<BaekRanks>(context, listen: false);
    });

    super.initState();
    _getRequest1();
    _getRequest2();
  }

  Future<void> _getRequest1() async {
    print("실행");
    String url = 'http://52.79.57.84:8080/user/git';
    http.Response response = await http.get(Uri.parse(url));
    print("실행2");
    if (response.statusCode == 200) {
      var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
      int count = parsingData['count'];

      for (int i = 0; i < count; i++) {
        print(i);
        bool isnull = false;
        String id = "";
        String githubImg = "";
        String name = "";
        int commit = 0;

        id = parsingData['data'][i]['githubId'];
        githubImg = parsingData['data'][i]['githubImg'];
        name = parsingData['data'][i]['user']['name'];
        commit = parsingData['data'][i]['commits'];
        if (parsingData['data'][i]['githubImg'] == null) {
          isnull = true;
        }
        print("$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i");
        print(githubImg);
        print("$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i$i");

        ranks1.add(i, githubImg, id, name, commit, isnull);
      }
    } else {
      print("오류발생");
    }
  }

  Future<void> _getRequest2() async {
    print("실행");
    String url = 'http://52.79.57.84:8080/user/boj';
    http.Response response = await http.get(Uri.parse(url));
    print("실행2");
    if (response.statusCode == 200) {
      var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
      int count = parsingData['count'];

      for (int i = 0; i < count; i++) {
        print(i);
        bool isnull = false;
        String img = "";
        String id = "";
        String name = "";
        int tier = 0;
        int rating = 0;

        img = parsingData['data'][i]['bojImg'];
        id = parsingData['data'][i]['bojId'];
        name = parsingData['data'][i]['user']['name'];
        tier = parsingData['data'][i]['tier'];
        rating = parsingData['data'][i]['rating'];
        if (parsingData['data'][i]['githubImg'] == null) {
          isnull = true;
        }

        ranks2.add(i, isnull ? "true" : img, id, name, tier, rating);
      }
    } else {
      print("오류발생");
    }
    // ignore: use_build_context_synchronously
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SpinKitWave(color: CommonColor.blue)),
    );
  }
}

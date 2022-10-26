import 'package:bssm_app/common/common.dart';
import 'package:bssm_app/provider/baekjoonranks.dart';
import 'package:bssm_app/provider/githubranks.dart';
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
  // ignore: prefer_typing_uninitialized_variables
  var ranks1;
  // ignore: prefer_typing_uninitialized_variables
  var ranks2;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ranks1 = Provider.of<GitRanks>(context, listen: false);
      ranks2 = Provider.of<BaekRanks>(context, listen: false);
    });
    _getRequest1();
    _getRequest2();
    super.initState();
  }

  Future<void> _getRequest1() async {
    print("gitstart");

    String url = 'http://52.78.155.216:8080/user/git';
    http.Response response = await http.get(Uri.parse(url));
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
      int count = parsingData['count'];
      ranks1.clearly();
      for (int i = 0; i < count; i++) {
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
        print("success1");
        ranks1.add(i, githubImg, id, name, commit, isnull);
      }
    } else {
      //오류 발생 코드
    }
  }

  Future<void> _getRequest2() async {
    print("boj start");
    String url = 'http://52.78.155.216:8080/user/boj';
    http.Response response = await http.get(Uri.parse(url));
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var parsingData = jsonDecode(utf8.decode(response.bodyBytes));

      int count = parsingData['count'];
      ranks2.clearly();
      for (int i = 0; i < count; i++) {
        bool isnull = false;
        String img = "";
        String id = "";
        String name = "";
        String tier = "";
        int rating = 0;
        int maxrating = 0;

        img = parsingData['data'][i]['bojImg'];
        id = parsingData['data'][i]['bojId'];
        name = parsingData['data'][i]['user']['name'];
        rating = parsingData['data'][i]['rating'];

        if (rating < 30) {
          maxrating = 29;
          tier = "Unrated";
        } else if (rating < 60) {
          maxrating = 59;
          tier = "Bronze V";
        } else if (rating < 90) {
          maxrating = 89;
          tier = "Bronze IV";
        } else if (rating < 120) {
          maxrating = 119;
          tier = "Bronze III";
        } else if (rating < 150) {
          maxrating = 149;
          tier = "Bronze II";
        } else if (rating < 200) {
          maxrating = 199;
          tier = "Bronze I";
        } else if (rating < 300) {
          maxrating = 299;
          tier = "Silver V";
        } else if (rating < 400) {
          maxrating = 399;
          tier = "Silver IV";
        } else if (rating < 500) {
          maxrating = 499;
          tier = "Silver III";
        } else if (rating < 650) {
          maxrating = 649;
          tier = "Silver II";
        } else if (rating < 800) {
          maxrating = 799;
          tier = "Silver I";
        } else if (rating < 950) {
          maxrating = 949;
          tier = "Gold V";
        } else if (rating < 1100) {
          maxrating = 1099;
          tier = "Gold IV";
        } else if (rating < 1250) {
          maxrating = 1249;
          tier = "Gold III";
        } else if (rating < 1400) {
          maxrating = 1399;
          tier = "Gold II";
        } else if (rating < 1600) {
          maxrating = 1599;
          tier = "Gold I";
        } else if (rating < 1750) {
          maxrating = 1749;
          tier = "Platinum V";
        } else if (rating < 1900) {
          maxrating = 1899;
          tier = "Platinum IV";
        } else if (rating < 2000) {
          maxrating = 1999;
          tier = "Platinum III";
        } else if (rating < 2100) {
          maxrating = 2099;
          tier = "Platinum II";
        } else if (rating < 2200) {
          maxrating = 2199;
          tier = "Platinum I";
        } else if (rating < 2300) {
          maxrating = 2299;
          tier = "Diamond V";
        } else if (rating < 2400) {
          maxrating = 2399;
          tier = "Diamond IV";
        } else if (rating < 2500) {
          maxrating = 2499;
          tier = "Diamond III";
        } else if (rating < 2600) {
          maxrating = 2599;
          tier = "Diamond II";
        } else if (rating < 2700) {
          maxrating = 2699;
          tier = "Diamond I";
        } else if (rating < 2800) {
          maxrating = 2799;
          tier = "Ruby V";
        } else if (rating < 2850) {
          maxrating = 2849;
          tier = "Ruby IV";
        } else if (rating < 2900) {
          maxrating = 2899;
          tier = "Ruby III";
        } else if (rating < 2950) {
          maxrating = 2949;
          tier = "Ruby II";
        } else if (rating < 3000) {
          maxrating = 2999;
          tier = "Ruby I";
        } else if (rating > 3000) {
          maxrating = 10000;
          tier = "Master";
        }

        if (parsingData['data'][i]['githubImg'] == null) {
          isnull = true;
        }

        print("success2");
        ranks2.add(i, isnull ? "true" : img, id, name, tier, rating, maxrating);
      }
    } else {
      print("error");
    }
    // ignore: use_build_context_synchronously
    Navigator.push(context, MaterialPageRoute(builder: (_) => const Rank()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SpinKitWave(color: CommonColor.blue)),
    );
  }
}

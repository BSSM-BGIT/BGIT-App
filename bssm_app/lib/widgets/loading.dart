import 'package:bssm_app/model/glist.dart';
import 'package:bssm_app/screens/bottombar/rank.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  List<GitRanklist> ranks = <GitRanklist>[];

  bool finish = false;

  @override
  void initState() {
    print("시작");
    super.initState();
    _getRequest();
  }

  Future<void> _getRequest() async {
    print("실행");
    String url = 'http://52.79.57.84:8080/user/git';
    http.Response response = await http.get(Uri.parse(url));
    print("실행2");
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      int count = parsingData['count'];

      for (int i = 0; i < count; i++) {
        bool isnull = false;
        String id = "";
        String githubImg = "";
        String name = "";
        int commit = 0;

        id = parsingData['data'][i]['githubId'];
        githubImg = parsingData['data'][i]['githubImg'];
        print(githubImg);
        name = parsingData['data'][i]['user']['name'];
        commit = parsingData['data'][i]['commits'];
        if (parsingData['data'][i]['githubImg'] == null) {
          isnull = true;
        }

        ranks.add(
          GitRanklist(
              i + 1, isnull ? "2" : githubImg, id, name, commit, isnull),
        );
        // ignore: use_build_context_synchronously
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => Rank(gitranks: ranks)));
      }
    } else {
      print("오류발생");
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: SpinKitWave(color: Colors.yellow)),
    );
  }
}

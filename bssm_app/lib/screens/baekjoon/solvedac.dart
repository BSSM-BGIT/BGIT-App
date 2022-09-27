import 'package:flutter/material.dart';

class SolvedAc extends StatefulWidget {
  final String code;

  const SolvedAc({super.key, required this.code});

  @override
  State<SolvedAc> createState() => _SolvedAcState();
}

class _SolvedAcState extends State<SolvedAc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: const [
            Text(
              "SolvedAc 상태메세지에 \n 코드를 입력해주세요!",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:bssm_app/model/glist.dart';
import 'package:bssm_app/screens/bottombar/community.dart';
import 'package:bssm_app/screens/bottombar/rank.dart';
import 'package:bssm_app/screens/bottombar/user.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _BottomState();
}

class _BottomState extends State<HomePage> {
  var _currentIndex = 0;

  List<Widget> _children = [const Rank(), const Community(), const User()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: IndexedStack(
        index: _currentIndex,
        children: _children,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 15.w, right: 15.w),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                top: BorderSide(
                    color: Colors.black.withOpacity(0.1), width: 1.w))),
        child: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => {_currentIndex = i}),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(FontAwesomeIcons.rankingStar),
              title: const Text("Rank"),
              selectedColor: Colors.purple,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: const Icon(Icons.people),
              title: const Text("community"),
              selectedColor: Colors.teal,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: const Icon(Icons.account_circle),
              title: const Text("User"),
              selectedColor: Colors.pink,
            ),
          ],
        ),
      ),
    );
  }
}

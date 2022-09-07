// import 'package:bssm_app/common/common.dart';
// import 'package:bssm_app/model/list.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class Rankview extends StatefulWidget {
//   final int myRank;
//   const Rankview({Key? key, required this.myRank}) : super(key: key);

//   @override
//   State<Rankview> createState() => _RankviewState();
// }

// class _RankviewState extends State<Rankview> {
//   List<Ranklist> ranks = <Ranklist>[];

//   int count = 10000;

//   @override
//   void initState() {
//     super.initState();
//     for (int i = 1; i <= 9; i++) {
//       ranks.add(Ranklist(i, "profile", "userName$i", "name", count));
//       count -= 100;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: makeRankList(context, ranks, widget.myRank),
//     );
//   }
// }

// List<Widget> makeRankList(
//     BuildContext context, List<Ranklist> ranks, int myRank) {
//   List<Widget> results = [];

//   for (var i = 0; i < ranks.length; i++) {
//     int rankcolor = colorSelect(ranks[i].rank);
//     results.add(Padding(
//       padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 12.h),
//       child: InkWell(
//         onTap: () {},
//         child: Container(
//           width: double.infinity,
//           height: 80.h,
//           decoration: BoxDecoration(
//               color: ranks[i].rank == myRank
//                   ? CommonColor.purple3
//                   : CommonColor.purple1,
//               borderRadius: BorderRadius.all(Radius.circular(20.r))),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Padding(
//                   padding: EdgeInsets.only(
//                       left: 23.w, right: 23.w, top: 10.h, bottom: 10.h),
//                   child: Text(
//                     "${ranks[i].rank}",
//                     style: TextStyle(color: Color(rankcolor), fontSize: 50.sp),
//                   )),
//               Container(height: 80.h, width: 2.w, color: CommonColor.purple2),
//               SizedBox(
//                 width: 12.w,
//               ),
//               
//               SizedBox(
//                 width: 5.w,
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(bottom: 4.h, top: 8.h),
//                     child: Text(
//                       ranks[i].userName,
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                   Text(
//                     ranks[i].name,
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 15.sp,
//                         fontWeight: FontWeight.w400),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: 60.w, right: 2.w, top: 5.h),
//                 child: const Icon(
//                   Icons.check_circle_outline,
//                   color: Colors.white,
//                 ),
//               ),
//               Text(
//                 "${ranks[i].commit}",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 30.sp,
//                     fontWeight: FontWeight.w100,
//                     fontFamily: 'Jesey'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
//   return results;
// }

// int colorSelect(int rank) {
//   int rankColor;
//   if (rank == 1) {
//     rankColor = 0xffFF3B5A;
//   } else if (rank == 2) {
//     rankColor = 0xffFF6A00;
//   } else if (rank == 3) {
//     rankColor = 0xffE6DA44;
//   } else {
//     rankColor = 0xffFFFFFFF;
//   }
//   return rankColor;
// }

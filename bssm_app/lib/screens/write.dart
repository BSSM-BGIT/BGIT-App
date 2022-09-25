import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Write extends StatefulWidget {
  const Write({super.key});

  @override
  State<Write> createState() => _WriteState();
}

class _WriteState extends State<Write> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  bool textcolor = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        setState(() {
          textcolor = false;
        });
      },
      child: SafeArea(
          child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "글 작성",
            style: TextStyle(
                fontFamily: 'Roboto', fontSize: 22.sp, color: Colors.black),
          ),
          elevation: 3.0,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.check,
                  color: Colors.black,
                ))
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                child: TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: '제목',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 5),
                    ),
                  ),
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    "내용",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: textcolor
                            ? Colors.blue
                            : Colors.black.withOpacity(0.6)),
                  )
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 5.h),
                  child: TextField(
                    onTap: () {
                      setState(() {
                        textcolor = true;
                      });
                    },
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: _contentController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(0.0),
                        ),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.w,
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      )),
    );
  }
}

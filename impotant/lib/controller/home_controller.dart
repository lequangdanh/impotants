import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int currentIndex = 0;
  DateTime startTime = DateTime(2022, DateTime.february, 19);
  late Duration remaining;
  Timer? t;
  Duration? ses;
  double rating =0;
   String s="",second="",m="",minute="",h="",hour="";
  void startTimer() async {
    t = Timer.periodic(const Duration(seconds: 1), (timer) {
      try {
        remaining = DateTime.now().difference(startTime);

        ses = remaining.inSeconds.seconds;
        s = format(ses!,6,9).toString();
        second = s.replaceAll(RegExp(r'[^\w\s]+'),'');
        m= format(ses!,3,6).toString();
        minute = m.replaceAll(RegExp(r'[^\w\s]+'),'');
        h = format(ses!,1,3).toString();
        hour = h.replaceAll(RegExp(r'[^\w\s]+'),'');

        update();


      } on Exception catch (_) {
        print("loi");
      }
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    startTimer();
  }

  format(Duration d, int a, int b) => d.toString().substring(a, b);
}

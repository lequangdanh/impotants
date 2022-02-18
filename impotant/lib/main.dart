import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:impotant/view/home/home_screen.dart';
import 'package:impotant/view/login/login_screen.dart';
import 'package:impotant/view/login/register_screen.dart';

import 'controller/home_controller.dart';
void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner:false ,
      initialRoute: '/',

      routes: {
        '/': (context)=>const HomeScreen(),
      },
    ),
  );
}
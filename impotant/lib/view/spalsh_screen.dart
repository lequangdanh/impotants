import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpalshScreen extends StatelessWidget {
  const SpalshScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF40BFFF),
        child: Center(
          child: SvgPicture.asset("asset/img/splash_icon.svg"),
        ),
      ),
    );
  }
}

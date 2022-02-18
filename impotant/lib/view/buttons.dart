import 'package:flutter/material.dart';

Widget buttons({required String text, VoidCallback? onTap}) {
  return GestureDetector(
      child: Container(
        width: 343,
        height: 57,
        decoration: BoxDecoration(
          color: const Color(0xFF40BFFF),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
      ),
      onTap: () {
        onTap;
      });
}

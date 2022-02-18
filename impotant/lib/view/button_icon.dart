import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget buttonIcon(
    {required String text, VoidCallback? onTap, required String icon}) {
  return GestureDetector(
    child: Container(
      width: 343,
      height: 57,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.black26),
      ),
      child: Center(
          child: Row(
        children: [
          Padding(
              padding: EdgeInsets.only(left: 10),
              child: SvgPicture.asset(
                icon,
                fit: BoxFit.scaleDown,
              )),
          const SizedBox(
            width: 80,
          ),
          Text(
            text,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.black12),
          ),
        ],
      )),
    ),
    onTap: () {
      onTap;
    },
  );
}

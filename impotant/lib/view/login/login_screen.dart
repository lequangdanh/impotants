import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../button_icon.dart';
import '../buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 0, right: 0),
          child: Column(
            children: [
              startForm(
                  textLight: "Sign in to continue",
                  textBold: "Welcome to E-com"),
              textFile(hintText: "Your Email", images: "asset/icons/email.svg"),
              const SizedBox(
                height: 10,
              ),
              textFile(
                  hintText: "Your PassWord", images: "asset/icons/pass.svg"),
              const SizedBox(
                height: 10,
              ),
              buttons(text: "Sign in"),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    child: Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                    width: 150,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "OR",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    child: Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                    width: 150,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              buttonIcon(
                  text: "Login with Google", icon: 'asset/icons/google.svg'),
              const SizedBox(
                height: 10,
              ),
              buttonIcon(
                  text: "Login with Facebook",
                  icon: 'asset/icons/facebook.svg'),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Forgot Password?",
                style: TextStyle(
                    color: Color(0xFF40BFFF),
                    fontSize: 12,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                      text: "Don’t have a account?",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins-l',
                          color: Colors.black26)),
                  TextSpan(
                      text: "Register",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF40BFFF))),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget textFile({required String hintText, required String images}) {
  return SizedBox(
    width: 343,
    height: 48,
    child: TextField(
      decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: SvgPicture.asset(
            images,
            fit: BoxFit.scaleDown,
          ),
          hintStyle: const TextStyle(fontSize: 12, fontFamily: 'Poppins-l'),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          )),
    ),
  );
}

Widget startForm({required String textLight, required String textBold}) {
  return Column(
    children: [
      const SizedBox(
        height: 120,
      ),
      Center(
        child: SvgPicture.asset("asset/icons/icon_login.svg"),
      ),
      const SizedBox(
        height: 15,
      ),
      Text(
        textBold,
        style: const TextStyle(fontSize: 16, fontFamily: 'Poppins'),
      ),
      const SizedBox(
        height: 15,
      ),
      Text(
        textLight,
        style: const TextStyle(
            fontSize: 12, fontWeight: FontWeight.w400, fontFamily: 'Poppins-l'),
      ),
      const SizedBox(
        height: 15,
      ),
    ],
  );
}

Widget richText({required String textLight, required String textBlue}) {
  return RichText(
    text: TextSpan(children: [
      TextSpan(
          text: textLight,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontFamily: 'Poppins-l',
              color: Colors.black26)),
      TextSpan(
          text: textBlue,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFF40BFFF))),
    ]),
  );
}

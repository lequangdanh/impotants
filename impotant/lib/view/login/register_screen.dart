import 'package:flutter/material.dart';
import 'package:impotant/view/buttons.dart';
import 'package:impotant/view/login/login_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              startForm(
                  textLight: "Create an new account",
                  textBold: "Let’s Get Started"),
              textFile(hintText: "Full Name", images: "asset/icons/admin.svg"),
              const SizedBox(
                height: 10,
              ),
              textFile(hintText: "Your Email", images: "asset/icons/email.svg"),
              const SizedBox(
                height: 10,
              ),
              textFile(hintText: "PassWord", images: "asset/icons/pass.svg"),
              const SizedBox(
                height: 10,
              ),
              textFile(
                  hintText: "Password Again", images: "asset/icons/pass.svg"),
              const SizedBox(
                height: 15,
              ),
              buttons(text: "Sign Up"),
              const SizedBox(
                height: 20,
              ),
              richText(textLight: "have a account?", textBlue: "Sign In"),
            ],
          ),
        ),
      ),
    );
  }
}

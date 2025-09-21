import 'package:flutter/material.dart';
import 'package:capstone/responsive.dart';
import 'components/login_form.dart';
import 'components/login_screen_top_image.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF2EBE6), // beige background
      body: Center(
        // centers horizontally & vertically
        child: SingleChildScrollView(
          child: Responsive(
            mobile: MobileLoginScreen(),
            desktop: Row(
              mainAxisAlignment: MainAxisAlignment.center, // horizontal center
              crossAxisAlignment: CrossAxisAlignment.center, // vertical align
              children: [
                Expanded(child: LoginScreenTopImage()),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [SizedBox(width: 450, child: LoginForm())],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center, // vertical center
      crossAxisAlignment: CrossAxisAlignment.center, // horizontal center
      children: <Widget>[
        LoginScreenTopImage(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // center form row
          children: [
            Spacer(),
            Expanded(flex: 8, child: LoginForm()),
            Spacer(),
          ],
        ),
      ],
    );
  }
}

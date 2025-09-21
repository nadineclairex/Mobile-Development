import 'package:flutter/material.dart';
import '../../responsive.dart';
import 'components/login_signup_btn.dart';
import 'components/welcome_image.dart';
import '../login/login_screen.dart';
import '../../../constants.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Fade-in animation trigger
    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) {
        setState(() {
          _opacity = 1.0;
        });
      }
    });
  }

  void _navigateToLogin() {
    setState(() {
      _opacity = 0.0;
    });

    Future.delayed(const Duration(milliseconds: 400), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kPrimaryColor,
              kSecondaryColor,
              kPrimaryLightColor,
            ],
          ),
        ),
        child: SafeArea(
          child: AnimatedOpacity(
            opacity: _opacity,
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut,
            child: SizedBox.expand(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    Responsive(
                      desktop: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Expanded(child: WelcomeImage()),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 450,
                                  child: LoginAndSignupBtn(
                                    onPressed: _navigateToLogin,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      mobile: MobileWelcomeScreen(onPressed: _navigateToLogin),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MobileWelcomeScreen extends StatelessWidget {
  final VoidCallback onPressed;

  const MobileWelcomeScreen({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const WelcomeImage(),
        const SizedBox(height: 30),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: LoginAndSignupBtn(
                onPressed: onPressed,
              ),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}

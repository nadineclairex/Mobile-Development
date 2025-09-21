import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Signup/signup_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Email field
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
              hintText: "Email",
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
              filled: true,
              fillColor: const Color(0xFFE8ECF4), // background color
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              prefixIcon: const Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.email),
              ),
            ),
          ),

          const SizedBox(height: defaultPadding),

          // Password field with eye toggle
          TextFormField(
            obscureText: _obscureText,
            textInputAction: TextInputAction.done,
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
              hintText: "Password",
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
              filled: true,
              fillColor: const Color(0xFFE8ECF4),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              prefixIcon: const Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.lock),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Forgot password text
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Forgot password?",
              style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
            ),
          ),

          const SizedBox(height: defaultPadding),

          // Sign in button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF6F2E00), // brown
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: () {},
            child: Text(
              "Sign in".toUpperCase(),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: defaultPadding),

          // Divider with OR
          Row(
            children: [
              const Expanded(child: Divider(thickness: 1)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "OR",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Expanded(child: Divider(thickness: 1)),
            ],
          ),

          const SizedBox(height: defaultPadding),

          // Google sign in button
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              side: BorderSide(color: Colors.grey.shade400),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/google.svg",
              height: 20,
              width: 20,
            ),
            label: const Text(
              "Sign in with Google",
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ),

          const SizedBox(height: 12),

          // Sign in with another account text
          Center(
            child: Text(
              "Sign in with another account",
              style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
            ),
          ),

          const SizedBox(height: defaultPadding),

          // Sign up link
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignUpScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

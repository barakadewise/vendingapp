import 'package:flutter/material.dart';
import 'package:vendingapp/auth/widget/user_login_form.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final String emailRegex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/img/drop2.png',
                    width: 80,
                    height: 80,
                  ),
                ],
              ),
              const Text(
                'GROUP 7 VENDINGAPP',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff176B87)),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Feel fresh with our water!',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff176B87)),
              ),
              const SizedBox(
                height: 20,
              ),
              // login form
              RegistrationForm(
                usernameController: usernameController,
                passwordController: passwordController,
              )
            ],
          ),
        ),
      ),
    );
  }
}

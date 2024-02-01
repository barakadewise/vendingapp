import 'package:flutter/material.dart';
import 'package:vendingapp/auth/widget/user_registration_form.dart';

class SignuPage extends StatefulWidget {
  const SignuPage({super.key});

  @override
  State<SignuPage> createState() => _SignuPageState();
}

class _SignuPageState extends State<SignuPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final TextEditingController nameController = TextEditingController();

  // logger instance
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Image.asset(
                "assets/img/drop2.png",
                height: 60,
                width: 60,
              ),
              const Text(
                'GROUP 7 VENDINGAPP',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff176B87)),
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Feel the diference.",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff176B87)
                      ))
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Join for free now',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Color(0xff176B87))),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              //registration  form
              RegistrationForm(
                  emailController: emailController,
                  passwordController: passwordController,
                  confirmPasswordController: confirmPasswordController,
                  nameController: nameController)
            ],
          ),
        ),
      ),
    );
  }
}

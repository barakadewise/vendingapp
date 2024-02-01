import 'package:flutter/material.dart';
import 'package:vendingapp/Home/presentation/home.dart';
import 'package:vendingapp/auth/presentation/signup.dart';

class RegistrationForm extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  RegistrationForm(
      {required this.usernameController,
      required this.passwordController,
      super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final String emailRegex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  errorStyle: const TextStyle(
                      fontSize: 10, fontWeight: FontWeight.w400),
                  floatingLabelStyle: const TextStyle(color: Colors.blueAccent),
                  labelStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w300),
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.blueAccent,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  isDense: true,
                  constraints:
                      const BoxConstraints(maxHeight: 70, minHeight: 50),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Username required";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  errorStyle: const TextStyle(
                      fontSize: 10, fontWeight: FontWeight.w400),
                  floatingLabelStyle: const TextStyle(color: Colors.blueAccent),
                  labelStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w300),
                  prefixIcon: const Icon(
                    Icons.lock_outline_rounded,
                    color: Colors.blueAccent,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  isDense: true,
                  constraints:
                      const BoxConstraints(maxHeight: 70, minHeight: 50),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password required";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  const Text(
                    'Don\'t have account?',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    const SignuPage())); //Navigate to the singnup page
                      },
                      child: const Text('Signup',
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold)))
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SizedBox(
                  height: 50,
                  width: size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      validatForm(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent),
                    child: const Text(
                      'Signin',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  )),
            ),
          ],
        ));
  }

  //Form validation function
  void validatForm(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const HomePage()));
    } else {
      print('Invalid formplease check the fields');
    }
  }
}

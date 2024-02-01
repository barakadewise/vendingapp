import 'package:flutter/material.dart';
import 'package:vendingapp/auth/presentation/login.dart';


class RegistrationForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController nameController;

  RegistrationForm(
      {required this.emailController,
      required this.passwordController,
      required this.confirmPasswordController,
      required this.nameController,
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

                controller: nameController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                    labelText: 'Name',
                    errorStyle: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w400),
                    floatingLabelStyle:
                        const TextStyle(color: Colors.blueAccent),
                    labelStyle: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w300),
                    prefixIcon: const Icon(
                      Icons.person_2_rounded,
                      color: Colors.blueAccent,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    constraints:
                        const BoxConstraints(maxHeight: 70, minHeight: 50),
                    isDense: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name required.";
                  } else if (value.contains(' ')) {
                    return "Space can't be use as name.";
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
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                    labelText: 'Email',
                    errorStyle: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w400),
                    floatingLabelStyle:
                        const TextStyle(color: Colors.blueAccent),
                    labelStyle: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w300),
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.blueAccent,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    constraints:
                        const BoxConstraints(maxHeight: 70, minHeight: 50),
                    isDense: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Valid email required!";
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
                
                controller: passwordController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                    labelText: 'Passowrd',
                    errorStyle: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w400),
                    floatingLabelStyle:
                        const TextStyle(color: Colors.blueAccent),
                    labelStyle: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w300),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.blueAccent,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    constraints:
                        const BoxConstraints(maxHeight: 70, minHeight: 50),
                    isDense: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password required..";
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
                controller: confirmPasswordController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                    labelText: 'Re-type password',
                    floatingLabelStyle:
                        const TextStyle(color: Colors.blueAccent),
                    errorStyle: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w400),
                    labelStyle: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w300),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.blueAccent,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    constraints:
                        const BoxConstraints(maxHeight: 70, minHeight: 50),
                    isDense: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password required!.";
                  } else if (confirmPasswordController.text !=
                      passwordController.text) {
                    return "Passwords mismatch!..";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Already have account?',
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  ),
                  TextButton(
                      onPressed: () {
                 
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    const Loginpage())); //Navigate to login page
                      },
                      child: const Text(
                        'login',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SizedBox(
                  height: 50,
                  width: size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      validateForm(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent),
                    child: const Text(
                      'Signup',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  )),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1,
                    width: 120,
                    color: Colors.black.withOpacity(0.1),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      'or',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.1),
                    height: 1,
                    width: 120,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                    print('Google sign in selsected...');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/img/google.png',
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                     
                     print('Facebook signin selected');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/img/facebook.png',
                        width: 40,
                        height: 40,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ));
  }

  //form validation function
  void validateForm(BuildContext context) {
    if (formKey.currentState!.validate()) {
     print('Registration from is valid....');
    } else {
   print('Registration form has issues to fix!');
    }
  }
}

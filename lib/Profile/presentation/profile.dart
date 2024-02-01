import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color(0xff176B87),
                        size: 25,
                      )),
                  const Text(
                    'Profile',
                    style: TextStyle(
                        color: Color(0xff176B87),
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    width: 20,
                  )
                ],
              ),
            ),
            const Center(
              child: Text('Profile page'),
            )
          ],
        ),
      ),
    );
  }
}

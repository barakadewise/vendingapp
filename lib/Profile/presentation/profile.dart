import 'package:flutter/material.dart';
import 'package:vendingapp/Home/presentation/home.dart';
import 'package:vendingapp/Profile/widgets/profile_tile.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const HomePage()));
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color(0xff176B87),
                        size: 25,
                      ),
                    ),
                    const Text(
                      'Profile',
                      style: TextStyle(
                        color: Color(0xff176B87),
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      color: Color(0xffB4D4FF),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const ProfileTile(title: 'Username', value: 'John Doe'),
                        const ProfileTile(
                            title: 'Account No', value: '1234567890'),
                        const ProfileTile(
                            title: 'Phone Number', value: '+1234567890'),
                        const ProfileTile(
                            title: 'Email', value: 'john@example.com'),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff176B87),
                                foregroundColor: Colors.white),
                            onPressed: () {
                              // Implement logout functionality
                            },
                            child: const Text(
                              'Logout',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vendingapp/dashbord/widgets/display_container.dart';
import 'package:vendingapp/dashbord/widgets/top_data_container.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // colors instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEF5FF),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color(0xff176B87),
                        size: 30,
                      )),
                  const Text(
                    'Water usage',
                    style: TextStyle(
                        color: Color(0xff176B87),
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_horiz,
                        color: Color(0xff176B87),
                        size: 30,
                      ))
                ],
              ),
            ),
            const TopDataContainer(),
            const DisplayContainer()
          ],
        ),
      ),
    );
  }
}

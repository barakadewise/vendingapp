import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Color(0xff176B87),
                      size: 25,
                    ),
                  ),
                  const Text(
                    'Settings',
                    style: TextStyle(
                      color: Color(0xff176B87),
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Display Mode',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Color(0xff176B87)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Dark Mode',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff176B87)),
                  ),
                  Switch(
                   
                    inactiveThumbColor: const Color(0xff86B6f6),
                    value: isDarkMode,
                    onChanged: (value) {
                      setState(() {
                        isDarkMode = value;
                      });
                    },
                    activeColor:
                        const Color(0xff176B87), // Customize color if needed
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

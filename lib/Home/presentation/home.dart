import 'package:flutter/material.dart';
import 'package:vendingapp/Profile/presentation/profile.dart';
import 'package:vendingapp/dashbord/presentation/dashboard.dart';
import 'package:vendingapp/setting/presentation/setting.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //pages list
  final List<Widget> pageList = [
    const Dashboard(),
    const Settings(),
    const Profile(),
  ];
  //declare the current page
  int currentIndepage = 0;

  //declare the initial page
  Widget currentPage = const Dashboard();

  //declare the storage backe
  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: bucket, child: currentPage),
      bottomNavigationBar: BottomAppBar(
          color: const Color(0xffB4D4FF),
          height: 65,
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  minWidth: 20,
                  onPressed: () {
                    setState(() {
                      currentPage = pageList[0];
                      currentIndepage = 0;
                    });
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.dashboard,
                        size: 20,
                        color: currentIndepage == 0
                            ? const Color(0xff176B87)
                            : const Color(0xffEEF5FF),
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                            color: currentIndepage == 0
                                ? const Color(0xff176B87)
                                : const Color(0xffEEF5FF)),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 20,
                  onPressed: () {
                    setState(() {
                      currentPage = pageList[1];
                      currentIndepage = 1;
                    });
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.settings,
                          size: 20,
                          color: currentIndepage == 1
                              ? const Color(0xff176B87)
                              : const Color(0xffEEF5FF)),
                      Text('setting',
                          style: TextStyle(
                              color: currentIndepage == 1
                                  ? const Color(0xff176B87)
                                  : const Color(0xffEEF5FF)))
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 20,
                  onPressed: () {
                    setState(() {
                      currentPage = pageList[2];
                      currentIndepage = 2;
                    });
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.person_2_sharp,
                          size: 20,
                          color: currentIndepage == 2
                              ? const Color(0xff176B87)
                              : const Color(0xffEEF5FF)),
                      Text('profile',
                          style: TextStyle(
                              color: currentIndepage == 2
                                  ? const Color(0xff176B87)
                                  : const Color(0xffEEF5FF)))
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

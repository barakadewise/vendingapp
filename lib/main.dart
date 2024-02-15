import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vendingapp/auth/presentation/login.dart';
import 'package:vendingapp/redux/store.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
    statusBarColor: const Color(0xffB4D4FF).withOpacity(0.3)
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return StoreProvider(
        store: store,
        child: MaterialApp(
        
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            
            scaffoldBackgroundColor: const Color(0xffEEF5FF),
            colorScheme:
                ColorScheme.fromSeed(seedColor: const Color(0xffEEF5FF)),
            useMaterial3: true,
          ),
          home: const Loginpage(),
        ));
  }
}

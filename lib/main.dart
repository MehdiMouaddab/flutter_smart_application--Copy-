import 'package:flutter/material.dart';
import 'package:flutter_smart_application/screens/home.page.dart';
import 'package:flutter_smart_application/screens/login.page.dart';
import 'package:flutter_smart_application/screens/register.page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (conrext) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}

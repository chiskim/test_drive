import 'package:flutter/material.dart';
import 'package:test_drive/homepage/home.dart';
import 'package:test_drive/screens/authenticate.dart';
//import 'package:test_drive/homepage/home.dart';

void main() {
  runApp(const MyApp());
}

class User {
  final String username;
  final String password;

  User({required this.username, required this.password});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SignInPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => const MyHomePage(),
      },
    );
  }
}


/*class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
          
      home: LoginPage(),
      
    );
  }
}*/



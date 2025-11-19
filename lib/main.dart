// ==================== main.dart ====================
import 'package:flutter/material.dart';
import 'main_screen.dart';

void main() {
  runApp(const MyProfileApp());
}

class MyProfileApp extends StatelessWidget {
  const MyProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0a0a0a),
        primaryColor: Colors.orange,
        fontFamily: 'Roboto',
      ),
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
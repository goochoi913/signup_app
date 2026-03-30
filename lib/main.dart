import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart'; // Imports Eva's screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fun Signup App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const WelcomeScreen(), // Starts the app here
    );
  }
}
import 'package:flutter/material.dart';
import 'package:le_chat/services/auth_service.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService authService=AuthService();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: const Text('homepage'),
        ),
    );
  }
}
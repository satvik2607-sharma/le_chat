import 'dart:async'; 
import 'package:flutter/material.dart';
import 'package:le_chat/pages/auth/login_page.dart';
import 'package:le_chat/pages/home_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    
    
    super.initState();


    Timer(const Duration(seconds: 2), (){

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  const LoginPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/login.png"),
        
              const SizedBox(
                height: 20,
              ),
        
        
              const Text("Groupie", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),)
            ],
          ),
        ),
      ),
    );
  }
}
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:soundbarz/Onboarding/login.dart';
import 'package:soundbarz/components.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: scaffoldColor,
      body: Center(
        child: Image.asset('assets/logos/applogo.png', fit: BoxFit.contain),
      ),
    );
  }
}
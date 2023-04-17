import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sliate_mngmt_app/home/pages/login_signup/login_page.dart';
import 'package:sliate_mngmt_app/home/pages/login_signup/signup_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override

  Widget build(BuildContext context) => isLogin ? loginscreen() : RegisterScreen();
  }


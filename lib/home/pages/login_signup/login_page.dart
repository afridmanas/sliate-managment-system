import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sliate_mngmt_app/home/pages/main.dart';
import 'package:sliate_mngmt_app/home/pages/home/home.dart';
import 'package:sliate_mngmt_app/home/pages/login_signup/signup_page.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({Key? key}) : super(key: key);

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                Text(
                  'Sign In',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(height: 35),
                TextField(
                  controller: emailcontroller,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(20.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    labelText: 'Email Address',
                    labelStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  controller: passwordcontroller,
                  obscureText: true,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(20.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0),
                  ),
                ),
                const SizedBox(height: 40.0),
                GestureDetector(
                  onTap: () {
                    (FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: emailcontroller.text,
                            password: passwordcontroller.text)
                        .then((value) => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => MymainpagePage())))
                            }));
                  },
                  child: Container(
                      height: 60.0,
                      width: size.width,
                      decoration: const BoxDecoration(
                          color: Color(0xFF653bbf),
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      child: const Center(
                        child: Text('Sign In',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 20.0)),
                      )),
                ),
                const SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  child: const Center(
                    child: Text('Don\'t have an account?',
                        style: TextStyle(
                            color: Color(0xFF653bbf),
                            fontWeight: FontWeight.w600,
                            fontSize: 15.0)),
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(width: 80, height: 1.0, color: Colors.black12),
                    const SizedBox(width: 20.0),
                    const Text('OR',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 12.0)),
                    const SizedBox(width: 20.0),
                    Container(width: 80, height: 1.0, color: Colors.black12),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          height: 60.0,
                          width: size.width / 2 - 40,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20.0)),
                            border: Border.all(width: 0.5, color: Colors.grey),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/google.png',
                                    width: 20.0),
                                const SizedBox(width: 15.0),
                                const Text("Google",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0)),
                              ],
                            ),
                          )),
                    ),
                    const SizedBox(width: 20.0),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 60.0,
                        width: size.width / 2 - 40,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                          border: Border.all(width: 0.5, color: Colors.grey),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/fb.png', width: 20.0),
                              const SizedBox(width: 15.0),
                              const Text("FaceBook",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.0)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

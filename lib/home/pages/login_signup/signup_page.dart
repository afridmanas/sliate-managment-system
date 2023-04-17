import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sliate_mngmt_app/home/pages/main.dart';
import 'package:sliate_mngmt_app/home/pages/home/home.dart';
import 'package:sliate_mngmt_app/home/pages/login_signup/login_page.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  late String _email, _password;
  String _errorMessage = '';

  Future<void> _submit() async {
    final form = _formKey.currentState;
    if (form?.validate() ?? false) {
      form?.save();
      try {
        final user = await _auth.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        print('User created: ${user.additionalUserInfo}');
        // Navigate to home page or another page
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          setState(() {
            _errorMessage =
                'The email address is already in use by another account.';
          });
        } else {
          print('Error: $e');
          setState(() {
            _errorMessage = 'An unexpected error occurred.';
          });
        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          _errorMessage = 'An unexpected error occurred.';
        });
      }
    }
  }

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 80),
                      Text(
                        'Create an Account',
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 35),
                      TextFormField(
                        controller: emailcontroller,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20.0),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          labelText: 'Email Address',
                          labelStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'email address is required';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          debugPrint(
                              'Value for field $_email saved as "$value"');
                        },
                        //onSaved: (value) => _email = value!.trim(),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: passwordcontroller,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20.0),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is Required';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          debugPrint(
                              'Value for field $_password saved as "$value"');
                        },
                        // onSaved: (value) => _password = value!.trim(),
                      ),
                      const SizedBox(height: 20.0),
                      const SizedBox(height: 20.0),
                      GestureDetector(
                        onTap: () {
                          (FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: emailcontroller.text,
                                  password: passwordcontroller.text)
                              .then((value) => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                MymainpagePage())))
                                  }));
                          onPressed:
                          _submit;
                        },
                        child: Container(
                            height: 60.0,
                            width: size.width,
                            decoration: BoxDecoration(
                                color: Color(0xFF653bbf),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0))),
                            child: Center(
                              child: Text('Create an Account',
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
                            MaterialPageRoute(
                                builder: (context) => loginscreen()),
                          );
                        },
                        child: Center(
                          child: Text('I have an account?',
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
                          Container(
                              width: 80, height: 1.0, color: Colors.black12),
                          const SizedBox(width: 20.0),
                          Text('OR',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.0)),
                          const SizedBox(width: 20.0),
                          Container(
                              width: 80, height: 1.0, color: Colors.black12),
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
                                      BorderRadius.all(Radius.circular(20.0)),
                                  border: Border.all(
                                      width: 0.5, color: Colors.grey),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/images/google.png',
                                          width: 20.0),
                                      const SizedBox(width: 15.0),
                                      Text("Google",
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
                                    BorderRadius.all(Radius.circular(20.0)),
                                border:
                                    Border.all(width: 0.5, color: Colors.grey),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/images/fb.png',
                                        width: 20.0),
                                    const SizedBox(width: 15.0),
                                    Text("FaceBook",
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
                      if (_errorMessage.isNotEmpty)
                        Text(
                          _errorMessage,
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

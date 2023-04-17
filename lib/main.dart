import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sliate_mngmt_app/Latest/screens/login/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SLIATE',
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: Scaffold(body: splash_screen(),)   );
  }
}

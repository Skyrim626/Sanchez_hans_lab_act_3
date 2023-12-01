import 'package:flutter/material.dart';

import 'package:sanchez_hans/signUp_page.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sanchez, Hans Zin Activity',
     
      debugShowCheckedModeBanner: false,
      home: SignUp(),
     
    );
  }
}

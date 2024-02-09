// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fashionapp/screens/CameraPage.dart';
import 'package:fashionapp/screens/InfoPage1.dart';
import 'package:fashionapp/screens/InfoPage2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(
        // This is the theme of your application.
        //
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CameraPage(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:fashionapp/screens/CameraPage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FASHION APP',
      theme: ThemeData(
        // Theme of our application.
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        scaffoldBackgroundColor: const Color(0xFFF2E8CF),
        useMaterial3: true,
      ),
      home: const CameraPage(),
    );
  }
}
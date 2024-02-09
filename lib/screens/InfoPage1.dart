import 'package:flutter/material.dart';

class InfoPage1 extends StatefulWidget {
  const InfoPage1({super.key});

  @override
  State<InfoPage1> createState() => _InfoPage1State();
}

class _InfoPage1State extends State<InfoPage1> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text('Camera page'),
          ],)
    );
  }
}

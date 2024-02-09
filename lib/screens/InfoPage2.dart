import 'package:flutter/material.dart';

class InfoPage2 extends StatefulWidget {
  const InfoPage2({super.key});

  @override
  State<InfoPage2> createState() => _InfoPage2State();
}

class _InfoPage2State extends State<InfoPage2> {

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

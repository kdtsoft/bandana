import 'package:flutter/material.dart';

class BandanaScreen extends StatefulWidget {
  const BandanaScreen({super.key});

  @override
  State<BandanaScreen> createState() => _BandanaScreenState();
}

class _BandanaScreenState extends State<BandanaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("This is Bandana Screen"),
      ),
    );
  }
}

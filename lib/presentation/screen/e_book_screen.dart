import 'package:flutter/material.dart';

class EBookScreen extends StatefulWidget {
  const EBookScreen({super.key});

  @override
  State<EBookScreen> createState() => _EBookScreenState();
}

class _EBookScreenState extends State<EBookScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("E-Book Screen"),),
    );
  }
}

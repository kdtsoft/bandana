import 'package:flutter/material.dart';

class BackGroundImg extends StatelessWidget {
  const BackGroundImg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.asset(
        "assets/images/bg2.jpg",
        fit: BoxFit.cover,
      ),
    );
  }
}

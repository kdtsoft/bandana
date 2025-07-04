import 'package:dhammapath/presentation/utils/const.dart';
import 'package:flutter/material.dart';

class BackGroundImg extends StatelessWidget {
  const BackGroundImg({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.asset(
        ConstData.bgImagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}

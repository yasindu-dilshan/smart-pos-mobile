import 'package:flutter/material.dart';

import '../constants.dart';
import 'input_container.dart';

class RoundedInput extends StatelessWidget {
  const RoundedInput({
    Key? key,
    required this.size,
    required this.icon,
    required this.hintText,
  }) : super(key: key);

  final Size size;
  final IconData icon;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      size: size,
      child: TextField(
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

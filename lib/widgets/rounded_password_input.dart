import 'package:flutter/material.dart';
import 'package:smart_pos_mobile/widgets/input_container.dart';

import '../constants.dart';

class RoundedPasswordInput extends StatelessWidget {
  RoundedPasswordInput(
      {required this.icon, required this.hintText, required this.size});
  final IconData icon;
  final String hintText;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      size: size,
      child: TextField(
        obscureText: true,
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

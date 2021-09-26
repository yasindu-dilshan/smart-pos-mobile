import 'package:flutter/material.dart';
import 'package:smart_pos_mobile/widgets/input_container.dart';

import '../constants.dart';

class RoundedPasswordInput extends StatelessWidget {
  RoundedPasswordInput(
      {required this.icon,
      required this.hintText,
      required this.size,
      required this.controller});
  final IconData icon;
  final String hintText;
  final Size size;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      size: size,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password';
          }
          return null;
        },
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

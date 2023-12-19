// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class AuthTextBox extends StatelessWidget {
  AuthTextBox({
    super.key,
    required this.hint,
    required this.controller,
    required this.icon,
    this.obscureText,
  });

  final String hint;
  final TextEditingController controller;
  final IconData icon;
  bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      decoration: const BoxDecoration(),
      child: TextField(
        controller: controller,
        obscureText: obscureText == true ? true : false,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(icon),
          hintText: hint,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {super.key, required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 25,
        ),
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 18,letterSpacing: 0),
        ),
      ],
    );
  }
}

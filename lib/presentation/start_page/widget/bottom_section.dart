import 'package:flutter/material.dart';

class BottomSection extends StatelessWidget {
  final String title;

  const BottomSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          title,
          style: const TextStyle(
            letterSpacing: 2,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Center(
          child: Text(
            "Netflix is a subscription-based streaming service that allows our members to watch TV shows and movies...",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

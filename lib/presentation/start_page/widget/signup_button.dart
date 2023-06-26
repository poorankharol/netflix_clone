import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/main/main_screen.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin:const  EdgeInsets.all(25),
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 216, 14, 0),
          borderRadius: BorderRadius.circular(5)),
      child: TextButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => MainScreen(),
            ),
          );
        },
        child: const Text(
          "SIGN IN",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

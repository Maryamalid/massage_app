import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    required this.color,
    required this.title,
    required this.onPressed,
    super.key,
  });

  final Color color;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 80),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 9,
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Color.fromARGB(255, 254, 255, 255),
            // fontStyle: FontStyle.italic,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

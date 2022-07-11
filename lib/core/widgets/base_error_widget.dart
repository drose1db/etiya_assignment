import 'package:flutter/material.dart';

class BaseErrorWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const BaseErrorWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: 75,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          alignment: Alignment.center,
          decoration:
              BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(20)), color: Colors.red.shade900),
          child: TextButton(
            onPressed: onPressed,
            child: const Text(
              "⚡ An error occurred! Tap to refresh ⚡",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )),
    );
  }
}

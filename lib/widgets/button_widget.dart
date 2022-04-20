import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  // ignore: use_key_in_widget_constructors
  const ButtonWidget({
    required this.text,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(52),
          primary: Colors.orangeAccent.shade100,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        onPressed: onClicked,
      );
}

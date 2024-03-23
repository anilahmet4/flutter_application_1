import 'package:flutter/material.dart';

class ProfileInputContainer extends StatelessWidget {
  final String text1;
  final String text2;

  const ProfileInputContainer({
    super.key,
    required this.text1,
    required this.text2,
    });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text1,
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
        Text(text2,
          style: const TextStyle(
            fontSize: 22,
          ),
        )
      ],
    );
  }
}
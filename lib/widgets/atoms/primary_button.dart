import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print('clicked');
      },
      child: const Text('Primary'),
    );
  }
}

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomElevatedButton extends StatelessWidget {
  final Widget child;
  Size? size;
  OutlinedBorder? shape;
  final VoidCallback onPressed;
  
  CustomElevatedButton({required this.child, this.size, this.shape, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed, 
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          shadowColor: Theme.of(context).colorScheme.primary,
          elevation: 15,
          fixedSize: size,
          shape: shape
        ),
        child: child,
      );
  }
}
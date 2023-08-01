import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomIconButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback onPressed;
  final double iconSize;
  

  const CustomIconButton({required this.icon, required this.onPressed, this.iconSize = 28.0 , Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed, 
      icon: icon,
      iconSize: iconSize,
    );
  }
}
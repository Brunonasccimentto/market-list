import 'package:flutter/material.dart';

import 'custom_IconButton.dart';

class CustomSearchBar extends StatelessWidget {
  final void Function(String) fieldOnChanged;
  final VoidCallback clearIconOnPressed;

  const CustomSearchBar({required this.fieldOnChanged, required this.clearIconOnPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Center(
            child: TextField(
          onChanged: fieldOnChanged,
          autofocus: true,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              suffixIcon: CustomIconButton(
                icon: const Icon(Icons.clear),
                onPressed: clearIconOnPressed
              ),
              hintText: 'Search...',
              border: InputBorder.none),
        )));
  }
}

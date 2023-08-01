import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final dynamic value;
  final List<dynamic> items;
  final void Function(dynamic) onChanged;

  const CustomDropdown({required this.value, required this.onChanged, required this.items, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        value: value,
        items: items.map<DropdownMenuItem>((item) {
          return DropdownMenuItem(
            value: item, 
            child: Text("$item"));
        }).toList(),
        onChanged: onChanged
      );
  }
}

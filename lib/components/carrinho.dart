import 'package:flutter/material.dart';

class Carrinho extends StatelessWidget {
  final double value;

  const Carrinho({required this.value,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        padding: const EdgeInsets.only(left: 10),
        child: ListTile(
          leading: const Icon(Icons.shopping_cart,
              size: 40, color: Colors.black87, semanticLabel: "Carrinho"),
          title: const Text("Carrinho"),
          subtitle: Text(
              "R\$ ${value.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 20, color: Colors.black87)),
        ));
  }
}

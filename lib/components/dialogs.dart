import 'package:flutter/material.dart';

class Dialogs extends StatelessWidget {
  final List<Widget> actions;

  const Dialogs({required this.actions, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Excluir itens"),
      content:
          const Text("Deseja excluir permanentemente os itens selecionados ?"),
      actions: actions
    );
  }
}

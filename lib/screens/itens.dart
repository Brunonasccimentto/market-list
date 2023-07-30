import 'package:flutter/material.dart';
import 'package:projeto_final/components/custom_field.dart';
import 'package:projeto_final/entities/produto.dart';
import 'package:projeto_final/services/database.dart';

import '../services/app_controler.dart';

class Itens extends StatefulWidget {
  final String title;

  const Itens({super.key, required this.title});

  @override
  State<Itens> createState() => _ItensState();
}

class _ItensState extends State<Itens> {

  late String nomeDoProduto;
  late int quantidade;
  late double preco;
  late List unidades = ["un", "dz", "kg", "g", "L", "ml", "Caixa", "Embalagem", "Lata", "Pacote"];
  String unidadeSelecionada = 'un';
  bool addAoCarrinho = false;
  bool produtoComprado = false;

  _cadastrarProduto() {
    DatabaseService().cadastrarProduto(Produto(
      nomeDoProduto: nomeDoProduto, 
      quantidade: quantidade, 
      unidade: unidadeSelecionada, 
      preco: preco,
      addAoCarrinho: addAoCarrinho,
      produtoComprado: produtoComprado));

      print("cadastrado");
  }

  carregarListaDeProdutos() async{
    await AppController.instance.listarProdutosNoCarrinho();
    
  }

  @override
  Widget build(BuildContext context) {
    var args = widget.title == "Editar item" ? ModalRoute.of(context)?.settings.arguments as Produto : null;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, 
            children: [
              CustomField(
                labelText: "Nome do produto",
                initialValue: args?.nomeDoProduto,
                autoFocus: true,
                onChanged: (value) {
                  setState(() {
                    nomeDoProduto = value;
                    
                  });
                },
              ),
              Row(
                children: [

                  Flexible(
                    child: CustomField(
                      labelText: "Quantidade",
                      initialValue: args?.quantidade.toString(),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          quantidade = int.parse(value);
                        });
                      },
                    ),
                  ),

                  const SizedBox(
                    width: 40,
                  ),

                  Flexible(
                    child: CustomField(
                      labelText: "Preço",
                      initialValue: args?.preco.toStringAsFixed(2),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          preco = double.parse(value);
                        });
                      },
                    )
                  )
                ],
              ),
              Row(
                children: [
                  Flexible(
                    child: DropdownButtonFormField(
                      value: args == null ? unidadeSelecionada : args.unidade,
                      items: unidades.map<DropdownMenuItem>((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item));
                      }).toList(),
                      onChanged: (value){
                        setState(() {
                          unidadeSelecionada = value;
                        });
                      }),
                  ),

                   const SizedBox(
                    width: 40,
                  ),

                  Flexible(
                    child: Row(
                      children: [
                        const Flexible(
                          child: Icon(Icons.shopping_cart_outlined)
                        ),
                        Flexible(
                          child: Checkbox(
                          value: args == null? addAoCarrinho : args.addAoCarrinho,
                          onChanged: (bool? value) {
                            setState(() {
                              addAoCarrinho = value!;
                              print(addAoCarrinho);
                            });
                          }),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              widget.title != 'Editar item' ?
                TextButton(
                  onPressed: () async {
                    _cadastrarProduto();
                    carregarListaDeProdutos();
                    Navigator.of(context).pushReplacementNamed('/');
                  },
                  child: const Text("Cadastrar item"))
                  : TextButton(
                  onPressed: () async {
                    
                    Navigator.of(context).pushReplacementNamed('/');
                  },
                  child: const Text("Salvar")),

                  // TextButton(
                  // onPressed: () async {
                  //   DatabaseService().deletarTodos();
                  //   Navigator.pushNamed(context, '/');
                  // },
                  // child: const Text("deletar db"))

        ]),
      ),
    );
  }
}

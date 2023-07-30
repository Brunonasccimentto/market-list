import 'package:flutter/material.dart';
import 'package:projeto_final/entities/produto.dart';
import 'package:projeto_final/services/database.dart';

import '../services/app_controler.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  bool headerSearchController = false;
  List<Produto> produtos = [];
  List<bool> _selected = [];

  @override
  void initState() {
    super.initState();
    _listarProdutos();
  }

 Future<void> _listarProdutos() async {
  final produtosData = await DatabaseService().listarProdutos();
  setState(() {
    produtos = produtosData;
    _selected = List.generate(produtos.length, (index) => false);
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: headerSearchController == false
            ? const Text("Produtos")
            : Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                    child: TextField(
                      autofocus: true,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            headerSearchController = !headerSearchController;
                          });
                        },
                      ),
                      hintText: 'Search...',
                      border: InputBorder.none),
                ))),
        actions: [
          headerSearchController == false
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      headerSearchController = !headerSearchController;
                    });
                  },
                  icon: const Icon(Icons.search),
                  iconSize: 28.0,
                )
              : Container(),
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
       body: Center(
        child: produtos.isEmpty ? 
        const Text("Nenhum produto encontrado")
        : ListView.builder(
          itemCount: produtos.length,
          itemBuilder: (context, index) {
            final produto = produtos[index];
            return CheckboxListTile(
              title: Text(produto.nomeDoProduto),
              subtitle: Text('${produto.quantidade} ${produto.unidade} = R\$${produto.preco.toStringAsFixed(2)}'), 

              value: produto.addAoCarrinho,
              onChanged: (bool? value) async { 
                await DatabaseService().atualizarProdutoAdicionadoAoCarrinho(produto);
                
                _listarProdutos();               
                await AppController.instance.listarProdutosNoCarrinho();
               },            
            );
          },
        ),
      ),

      floatingActionButton: ElevatedButton(
              onPressed: () {
                
                Navigator.of(context).pushReplacementNamed('/');}, 
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                shadowColor: Theme.of(context).colorScheme.primary,
                elevation: 15,
                
              ),
              child: const Text("Adicionar a lista"),
            ) 

    );
  }
}

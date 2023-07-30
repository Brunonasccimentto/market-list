import 'package:flutter/material.dart';
import 'package:projeto_final/entities/produto.dart';
import 'package:projeto_final/services/app_controler.dart';

import '../services/database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Produto> produtosNoCarrinho = [];
  double valorProdutosComprados = 0;

  @override
  void initState() {
    super.initState();
    carregarListaDeProdutos();
    
  }

  carregarListaDeProdutos() async{
    var listarProdutosNoCarrinho = await DatabaseService().listarProdutosNoCarrinho();
    setState(() {
      produtosNoCarrinho = listarProdutosNoCarrinho;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Minha lista"),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          actions: [
            
            IconButton(
              onPressed: () {Navigator.pushNamed(context, '/produtos');}, 
              icon: const Icon(Icons.format_list_bulleted_add),
              iconSize: 28.0,
            ),
          ],
        ),
      body: Center(
        child: AppController.instance.produtosNoCarrinho.isEmpty ? 
        const Text("Nenhum produto foi adicionado ao carrinho")
        : ListView.builder(
          itemCount: AppController.instance.produtosNoCarrinho.length,
          itemBuilder: (context, index)  {
            final produto = AppController.instance.produtosNoCarrinho[index];
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: ListTile(
                    title: Text(produto.nomeDoProduto,
                    style: produto.produtoComprado == false ? const TextStyle() :
                    produto.produtoComprado == true ? const TextStyle(decoration: TextDecoration.lineThrough) : 
                    const TextStyle(decoration: TextDecoration.none),
                    ),
                    subtitle: Text('${produto.quantidade} ${produto.unidade} = R\$${(produto.quantidade * produto.preco).toStringAsFixed(2)}'), 
                
                    onTap: () {
                      Navigator.pushNamed(context, '/editar item', arguments: produto);
                    },             
                  ),
                ),

                Flexible(
                  child: Checkbox(
                    value: produto.produtoComprado, 
                    onChanged: (bool? value) { 
                      
                      DatabaseService().riscarProdutoComprado(produto);               
                      carregarListaDeProdutos();
                      
                    }, 
                  ),
                )
              ],
            );
          },
        ),
      ),

      floatingActionButton: ElevatedButton(
        onPressed: () {Navigator.pushNamed(context, '/itens');}, 
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          shadowColor: Theme.of(context).colorScheme.primary,
          elevation: 15,
          fixedSize: const Size(50, 60),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
        child: const Icon(Icons.add, size: 24,),
      ),
    );
  }
}
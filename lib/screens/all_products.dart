import 'package:flutter/material.dart';
import 'package:projeto_final/entities/produto.dart';
import 'package:projeto_final/services/app_controler.dart';
import 'package:projeto_final/services/database.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  bool headerSearchController = false;
  List<Produto> produtos = [];
  List<Produto> produtosFiltrados = [];
  String? filtro;

  @override
  void initState() {
    super.initState();
    listarProdutos();
  }

  Future<void> listarProdutos() async {
    final produtosData = await DatabaseService().listarProdutos();
    setState(() {
      produtos = produtosData;
    });
  }

  filtrarProdutos(String value) {
    var listaProdutosFiltrados = produtos.where((element) => 
      element.nomeDoProduto.toLowerCase().contains(value.toLowerCase())
    ).toList();

    setState(() {
      produtosFiltrados = listaProdutosFiltrados;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
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
                      onChanged: (value) {
                        filtro = value;
                        filtrarProdutos(value);
                      },
                      autofocus: true,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          headerSearchController == false ? produtosFiltrados = [] : null;
                          setState(() {
                            filtro = null;
                            headerSearchController = !headerSearchController;
                          });
                        },
                      ),
                      hintText: 'Search...',
                      border: InputBorder.none),
                ))),
        actions: [

            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: const Text("Excluir itens"),
                            content: const Text(
                                "Deseja excluir permanentemente os itens selecionados ?"),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("Não")),
                              TextButton(
                                  onPressed: () async {
                                    if (filtro == null) {
                                      for (var element in produtos) {
                                        element.addAoCarrinho == true ?
                                        await DatabaseService().deletarProdutoSelecionado(element.produtoID) :
                                        null;
                                    }                         
                                    listarProdutos();

                                    } else {
                                      for (var element in produtosFiltrados) {
                                      await DatabaseService().deletarProdutoSelecionado(element.produtoID);
                                      
                                    }
                                    listarProdutos(); 
                                    filtrarProdutos(filtro!);                                     
                                  }

                                    Navigator.pop(context);                                    
                                  },
                                  child: const Text("Sim")),
                            ],
                          ));
                },
                icon: const Icon(Icons.delete_rounded)),

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
      ),

       body: filtro != null ?
        Center(
          child: produtosFiltrados.isEmpty ? 
          const Text("Nenhum produto encontrado")
          : ListView.builder(
            itemCount: produtosFiltrados.length,
            itemBuilder: (context, index) {
              final produto = produtosFiltrados[index];
              return Container(
                 margin: EdgeInsets.only(bottom: produtosFiltrados.length -1 == index ? 70 : 0),
                child: CheckboxListTile(
                  title: Text(produto.nomeDoProduto),
                  subtitle: Text('R\$${produto.preco.toStringAsFixed(2)}'), 
              
                  value: produto.addAoCarrinho,
                  onChanged: (bool? value) async { 
                    
                    await DatabaseService().atualizarProdutoAdicionadoAoCarrinho(produto);               
                    listarProdutos();   

                    if(produto.produtoComprado == true && produto.addAoCarrinho == false){
                      print("aqui");
                      AppController.instance.subtrair(produto);
                    }            
                    
                  },            
                ),
              );
            },
          ),
        ) :

        Center(
          child: produtos.isEmpty ? 
          const Text("Nenhum produto encontrado")
          : ListView.builder(
            itemCount: produtos.length,
            itemBuilder: (context, index) {
              final produto = produtos[index];
              return Container(
                margin: EdgeInsets.only(bottom: produtos.length -1 == index ? 70 : 0),
                child: CheckboxListTile(
                  title: Text(produto.nomeDoProduto),
                  subtitle: Text('R\$${produto.preco.toStringAsFixed(2)}'), 
              
                  value: produto.addAoCarrinho,
                  onChanged: (bool? value) async { 

                    await DatabaseService().atualizarProdutoAdicionadoAoCarrinho(produto);               
                    listarProdutos();     

                    if(produto.produtoComprado == true && produto.addAoCarrinho == false){
                      produto.produtoComprado = false;
                      AppController.instance.subtrair(produto);
                      DatabaseService().editarProduto(produto, produto.produtoID);
                    }                                
                  },            
                ),
              );
            },
          ),
        ),

      floatingActionButton: ElevatedButton(
              onPressed: () {
                
                Navigator.pop(context);}, 
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                shadowColor: Theme.of(context).colorScheme.primary,
                elevation: 15,
                
              ),
              child: const Text("atualizar lista"),
            ) 

    );
  }
}

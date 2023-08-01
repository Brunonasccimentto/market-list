import 'package:flutter/material.dart';
import 'package:projeto_final/components/custom_elevatedbutton.dart';
import 'package:projeto_final/components/custom_list.dart';
import 'package:projeto_final/components/dialogs.dart';
import 'package:projeto_final/components/search_bar.dart';
import 'package:projeto_final/entities/produto.dart';
import 'package:projeto_final/services/database.dart';
import '../components/custom_iconbutton.dart';

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
            : CustomSearchBar(
                fieldOnChanged: (value) {
                  filtro = value;
                  filtrarProdutos(value);
                }, 
                clearIconOnPressed: () {
                  headerSearchController == false
                      ? produtosFiltrados = []
                      : null;
                  setState(() {
                    filtro = null;
                    headerSearchController = !headerSearchController;
                  });
                }),      
        actions: [

            CustomIconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => Dialogs(
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  style: TextButton.styleFrom(foregroundColor: Colors.black87),
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
                                  style: TextButton.styleFrom(foregroundColor: Colors.black87),
                                  child: const Text("Sim")),
                            ],
                          ));
                },
                icon: const Icon(Icons.delete_rounded)),

            headerSearchController == false ?
              CustomIconButton(
                  onPressed: () {
                    setState(() {
                      headerSearchController = !headerSearchController;
                    });
                  },
                  icon: const Icon(Icons.search),
                  
                )
              : Container(),               
        ], 
      ),

      body: filtro != null ?
          CustomList(
            data: produtosFiltrados, 
            updateList: listarProdutos, 
            id: "produtos filtrados") :

          CustomList(
            data: produtos, 
            updateList: listarProdutos, 
            id: "produtos"),

      floatingActionButton: CustomElevatedButton(
        child: const Text("atualizar lista"), 
        onPressed: () {Navigator.pop(context);})
    );
  }
}

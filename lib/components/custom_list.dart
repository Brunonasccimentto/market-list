import 'package:flutter/material.dart';
import '../entities/produto.dart';
import '../services/app_controler.dart';
import '../services/database.dart';

class CustomList extends StatelessWidget {
  final List<Produto> data;
  final VoidCallback updateList;
  final String id;
  
  const CustomList({required this.data, required this.updateList, required this.id, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: data.isEmpty ? 
      const Text("Nenhum produto encontrado") :
      ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final produto = data[index];
          return Container(
            margin: EdgeInsets.only(bottom: data.length -1 == index ? 70 : 0),
            child: CheckboxListTile(
              title: Text(produto.nomeDoProduto),
              subtitle: Text('R\$${produto.preco.toStringAsFixed(2)}'),              
              value: produto.addAoCarrinho,
              onChanged: (bool? value) async {                    
                await DatabaseService().atualizarProdutoAdicionadoAoCarrinho(produto);               
                updateList();   
                
                switch (id) {
                  case "produtos":
                    if(produto.produtoComprado == true && produto.addAoCarrinho == false){
                        produto.produtoComprado = false;
                        AppController.instance.subtrair(produto);
                        DatabaseService().editarProduto(produto, produto.produtoID);
                      }                
                  break;
    
                  case "produtos filtrados":
                    if(produto.produtoComprado == true && produto.addAoCarrinho == false){                     
                          AppController.instance.subtrair(produto);
                        } 
                  break;
    
                  default:
                }                                                              
              },                
            ),
          );
        },
      ),
    ); 
  }
}
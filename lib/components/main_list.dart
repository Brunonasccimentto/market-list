import 'package:flutter/material.dart';
import '../entities/produto.dart';
import '../services/app_controler.dart';
import '../services/database.dart';

class MainList extends StatelessWidget {
  final List<Produto> data;
  final VoidCallback updateList;
  
  const MainList({required this.data, required this.updateList, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
            child: data.isEmpty ? 
            const Text("Nenhum produto foi adicionado ao carrinho")
            : ListView.builder(
              itemCount: data.length,         
              itemBuilder: (context, index)  {
                final produto = data[index];
                return Container(
                  margin: EdgeInsets.only(bottom: data.length -1 == index ? 70 : 0),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12, width: 1))
                  ),
                  child: Row(
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
                          onChanged: (bool? value) async {                            
                            await DatabaseService().riscarProdutoComprado(produto);                                                
                            updateList();
                
                            if(produto.produtoComprado == true){
                                AppController.instance.somar(produto);
                                // valorProdutosComprados = valorProdutosComprados + (produto.quantidade * produto.preco); 
                            } else {
                                // valorProdutosComprados = valorProdutosComprados - (produto.quantidade * produto.preco);
                                AppController.instance.subtrair(produto);
                            }
                          },                         
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );

  }
}
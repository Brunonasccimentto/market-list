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
              onPressed: () async {
                AppController.instance.limpar();
                await DatabaseService().limparProdutosNoCarrinho();
              }, 
              icon: const Icon(Icons.cleaning_services)),
            
            IconButton(
              onPressed: () {Navigator.pushNamed(context, '/produtos');}, 
              icon: const Icon(Icons.format_list_bulleted_add),
              iconSize: 28.0,
            ),
          ],
        ),
      body: FutureBuilder(
        future: carregarListaDeProdutos(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
          return Center(
            child: produtosNoCarrinho.isEmpty ? 
            const Text("Nenhum produto foi adicionado ao carrinho")
            : ListView.builder(
              itemCount: produtosNoCarrinho.length,         
              itemBuilder: (context, index)  {
                final produto = produtosNoCarrinho[index];
                return Container(
                  margin: EdgeInsets.only(bottom: produtosNoCarrinho.length -1 == index ? 70 : 0),
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
                          onLongPress: () {
                          
                          },         
                        ),
                      ),
                  
                      Flexible(
                        child: Checkbox(
                          value: produto.produtoComprado, 
                          onChanged: (bool? value) async { 
                            
                            await DatabaseService().riscarProdutoComprado(produto);                                                
                            carregarListaDeProdutos();
                
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

         },
        
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

      bottomNavigationBar: 
      Container(
              color: Colors.transparent,
              padding: const EdgeInsets.only(left: 10),           
              child: ListTile(
                leading: const Icon(Icons.shopping_cart, 
                size: 40, 
                color: Colors.black87,
                semanticLabel: "Carrinho"),
                title: const Text("Carrinho"),
                subtitle: Text("R\$ ${AppController.instance.valorProdutosComprados}", 
                style: const TextStyle(fontSize: 20, color: Colors.black87)),
              )),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:projeto_final/components/carrinho.dart';
import 'package:projeto_final/components/custom_elevatedbutton.dart';
import 'package:projeto_final/components/custom_iconbutton.dart';
import 'package:projeto_final/components/main_list.dart';
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
  void initState() {
    AppController.instance.initValorProdutosComprados();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Minha lista"),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          actions: [
            CustomIconButton(
            icon: const Icon(Icons.cleaning_services),
            onPressed: () async {
                AppController.instance.limpar();
                await DatabaseService().limparProdutosNoCarrinho();
            }), 
            
            CustomIconButton(
              onPressed: () {Navigator.pushNamed(context, '/produtos');}, 
              icon: const Icon(Icons.format_list_bulleted_add),
              
            ),
          ],
        ),
      body: FutureBuilder(
        future: carregarListaDeProdutos(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
          return MainList(
            data: produtosNoCarrinho, 
            updateList: carregarListaDeProdutos);
        },       
      ),

      floatingActionButton: CustomElevatedButton(
          onPressed: () {Navigator.pushNamed(context, '/itens');},
          size: const Size(50, 60),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          child: const Icon(Icons.add, size: 24),
        ),

      bottomNavigationBar: Carrinho(value: AppController.instance.valorProdutosComprados)
    );
  }
}
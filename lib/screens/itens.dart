import 'package:flutter/material.dart';
import 'package:projeto_final/components/custom_field.dart';
import 'package:projeto_final/entities/produto.dart';
import 'package:projeto_final/services/database.dart';

class Itens extends StatefulWidget {
  final String title;

  const Itens({super.key, required this.title});

  @override
  State<Itens> createState() => _ItensState();
}

class _ItensState extends State<Itens> {

  late String nomeDoProduto;
  int quantidade = 1;
  double preco = 0;
  late List unidades = ["un", "dz", "kg", "g", "L", "ml", "Caixa", "Embalagem", "Lata", "Pacote"];
  String unidadeSelecionada = 'un';
  bool addAoCarrinho = false;
  bool produtoComprado = false;

  @override
  Widget build(BuildContext context) {
    var args = widget.title == "Editar item" ? ModalRoute.of(context)!.settings.arguments as Produto : null;

    void cadastrarProduto() async {
      await DatabaseService().cadastrarProduto(Produto(
        nomeDoProduto: nomeDoProduto, 
        quantidade: quantidade, 
        unidade: unidadeSelecionada, 
        preco: preco,
        addAoCarrinho: addAoCarrinho,
        produtoComprado: produtoComprado ));
    }

    void editarProduto() async {
      await DatabaseService().editarProduto(Produto(
        nomeDoProduto:  args!.nomeDoProduto, 
        quantidade: args.quantidade, 
        unidade: args.unidade, 
        preco: args.preco,
        addAoCarrinho: args.addAoCarrinho,
        produtoComprado: args.produtoComprado), args.produtoID);
    }

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
                    args?.nomeDoProduto = value;
                    nomeDoProduto = value;        
                  });
                },
              ),
              Row(
                children: [

                  Flexible(
                    child: CustomField(
                      labelText: "Quantidade",
                      initialValue: args == null ? quantidade.toString() : args.quantidade.toString(),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          args?.quantidade = int.parse(value);
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
                      initialValue: args == null ? preco.toStringAsFixed(2) : args.preco.toStringAsFixed(2),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {  
                        print(value.runtimeType)    ;                 
                        setState(() {
                          args?.preco = double.parse(value);
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
                          args?.unidade = value;
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
                              args?.addAoCarrinho = value!;
                              addAoCarrinho = value!;
                              
                            });
                          }),
                        ),
                      ],
                    ),
                  )
                ],
              ),

                widget.title != "Editar item" ?
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: TextButton(
                    onPressed: () {
                      
                      cadastrarProduto();                  
                      Navigator.pop(context);
                    },
                      child: const Text("Cadastrar item")),
                ) :

                Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white
                        ),                                    
                        onPressed: () {
                
                          showDialog(
                            context: context, 
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text("Excluir item"),
                              content: const Text("Deseja excluir permanentemente esse item?"),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context), 
                                  child: const Text("Não")),
                
                                TextButton(
                                  onPressed: () async {
                                    await DatabaseService().deletarProdutoSelecionado([args!.produtoID]);
                                    Navigator.of(context)..pop()..pop();
                                  }, 
                                  child: const Text("Sim")),
                              ],));                      
                        },
                        child: const Text("Excluir"), 
                      ),
                
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          editarProduto();                   
                          Navigator.pop(context);
                        },
                        child: const Text("Salvar"), 
                      )
                    
                    ],
                  ),
                ),

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

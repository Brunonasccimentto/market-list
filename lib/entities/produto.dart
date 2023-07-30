import 'package:isar/isar.dart';

part 'produto.g.dart';

@Collection()
class Produto {
  Id produtoID = Isar.autoIncrement;
  String nomeDoProduto;
  int quantidade;
  String unidade;
  double preco;
  bool addAoCarrinho;
  bool produtoComprado;
  
  Produto({required this.nomeDoProduto,required this.quantidade,required this.unidade,required this.preco, required this.addAoCarrinho, required this.produtoComprado});
  
}
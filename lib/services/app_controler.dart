import 'package:flutter/foundation.dart';
import '../entities/produto.dart';

class AppController extends ChangeNotifier {

  static final AppController instance = AppController();
  double valorProdutosComprados = 0;
  
  void somar(Produto produto){
    valorProdutosComprados = valorProdutosComprados + (produto.quantidade * produto.preco);
    notifyListeners();
  }

  void subtrair(Produto produto){
    valorProdutosComprados = valorProdutosComprados - (produto.quantidade * produto.preco); 
    notifyListeners();                         
  }

  void limpar(){
    valorProdutosComprados = 0;
    notifyListeners();
  }

}
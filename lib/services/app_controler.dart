import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../entities/produto.dart';

class AppController extends ChangeNotifier {

  static final AppController instance = AppController();
  double valorProdutosComprados = 0;
  
  void somar(Produto produto) async{
    valorProdutosComprados = valorProdutosComprados + (produto.quantidade * produto.preco);

    preferences();
    notifyListeners();
  }

  void subtrair(Produto produto) async{
    valorProdutosComprados = valorProdutosComprados - (produto.quantidade * produto.preco);

    preferences(); 
    notifyListeners();                         
  }

  void limpar(){
    valorProdutosComprados = 0;
    preferences();
    notifyListeners();
  }

  void preferences() async{
    SharedPreferences prefsValue =  await SharedPreferences.getInstance();
    await prefsValue.setDouble("produtos", valorProdutosComprados);
  }

  void initValorProdutosComprados() async {
    SharedPreferences prefsValue =  await SharedPreferences.getInstance();
    valorProdutosComprados = (prefsValue.getDouble("produtos") ?? 0);
  
  }

}
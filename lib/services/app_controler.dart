import 'package:flutter/foundation.dart';
import 'package:projeto_final/services/database.dart';

import '../entities/produto.dart';

class AppController extends ChangeNotifier {

  static final AppController instance = AppController();
  List<Produto> produtosNoCarrinho = [];
  
  Future<void> listarProdutosNoCarrinho() async {
    produtosNoCarrinho = await DatabaseService().listarProdutosNoCarrinho();
    notifyListeners();
  }

}
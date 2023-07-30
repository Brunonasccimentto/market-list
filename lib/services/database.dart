import 'package:path_provider/path_provider.dart';
import 'package:projeto_final/entities/produto.dart';
import 'package:isar/isar.dart';

class DatabaseService {
  static final DatabaseService _singleton = DatabaseService._internal();

  factory DatabaseService() {
    return _singleton;
  }

  DatabaseService._internal();

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      print("Instancia aberta");
      return await Isar.open(
        [ProdutoSchema],
        inspector: true,
        directory: dir.path,
      );
    }

    return Future.value(Isar.getInstance());
  }

  Future<void> cadastrarProduto(Produto produto) async {
    final isarDB = await openDB();

    await isarDB.writeTxn(() async {
      await isarDB.produtos.put(produto);
    });
  }

  Future<List<Produto>> listarProdutos() async {
    final isarDB = await openDB();
    return await isarDB.produtos.where().findAll();
  }

  Future<List<Produto>> listarProdutosNoCarrinho() async {
    final isarDB = await openDB();
    return await isarDB.produtos.where().filter().addAoCarrinhoEqualTo(true).findAll();
  }

  Future<void> atualizarProdutoAdicionadoAoCarrinho(Produto produto) async {
    final isarDB = await openDB();

    await isarDB.writeTxn(() async {
      produto.addAoCarrinho = !produto.addAoCarrinho;
      await isarDB.produtos.put(produto);
    });
  }

  Future<void> riscarProdutoComprado(Produto produto) async {
    final isarDB = await openDB();

    await isarDB.writeTxn(() async {
      produto.produtoComprado = !produto.produtoComprado;
      print(produto.produtoComprado );
      await isarDB.produtos.put(produto);
    });
  }

  Future<void> deletarTodos() async {
    final isarDB = await openDB();
    await isarDB.writeTxn(() async {
      await isarDB.produtos.clear();
    });
  }

  Future<void> deletarSelecionados(listaProdutosId) async {
    final isarDB = await openDB();
    await isarDB.produtos.deleteAll(listaProdutosId);
  }

}

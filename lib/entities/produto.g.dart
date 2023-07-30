// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetProdutoCollection on Isar {
  IsarCollection<Produto> get produtos => this.collection();
}

const ProdutoSchema = CollectionSchema(
  name: r'Produto',
  id: -1962595252623852481,
  properties: {
    r'addAoCarrinho': PropertySchema(
      id: 0,
      name: r'addAoCarrinho',
      type: IsarType.bool,
    ),
    r'nomeDoProduto': PropertySchema(
      id: 1,
      name: r'nomeDoProduto',
      type: IsarType.string,
    ),
    r'preco': PropertySchema(
      id: 2,
      name: r'preco',
      type: IsarType.double,
    ),
    r'produtoComprado': PropertySchema(
      id: 3,
      name: r'produtoComprado',
      type: IsarType.bool,
    ),
    r'quantidade': PropertySchema(
      id: 4,
      name: r'quantidade',
      type: IsarType.long,
    ),
    r'unidade': PropertySchema(
      id: 5,
      name: r'unidade',
      type: IsarType.string,
    )
  },
  estimateSize: _produtoEstimateSize,
  serialize: _produtoSerialize,
  deserialize: _produtoDeserialize,
  deserializeProp: _produtoDeserializeProp,
  idName: r'produtoID',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _produtoGetId,
  getLinks: _produtoGetLinks,
  attach: _produtoAttach,
  version: '3.1.0+1',
);

int _produtoEstimateSize(
  Produto object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.nomeDoProduto.length * 3;
  bytesCount += 3 + object.unidade.length * 3;
  return bytesCount;
}

void _produtoSerialize(
  Produto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.addAoCarrinho);
  writer.writeString(offsets[1], object.nomeDoProduto);
  writer.writeDouble(offsets[2], object.preco);
  writer.writeBool(offsets[3], object.produtoComprado);
  writer.writeLong(offsets[4], object.quantidade);
  writer.writeString(offsets[5], object.unidade);
}

Produto _produtoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Produto(
    addAoCarrinho: reader.readBool(offsets[0]),
    nomeDoProduto: reader.readString(offsets[1]),
    preco: reader.readDouble(offsets[2]),
    produtoComprado: reader.readBool(offsets[3]),
    quantidade: reader.readLong(offsets[4]),
    unidade: reader.readString(offsets[5]),
  );
  object.produtoID = id;
  return object;
}

P _produtoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _produtoGetId(Produto object) {
  return object.produtoID;
}

List<IsarLinkBase<dynamic>> _produtoGetLinks(Produto object) {
  return [];
}

void _produtoAttach(IsarCollection<dynamic> col, Id id, Produto object) {
  object.produtoID = id;
}

extension ProdutoQueryWhereSort on QueryBuilder<Produto, Produto, QWhere> {
  QueryBuilder<Produto, Produto, QAfterWhere> anyProdutoID() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ProdutoQueryWhere on QueryBuilder<Produto, Produto, QWhereClause> {
  QueryBuilder<Produto, Produto, QAfterWhereClause> produtoIDEqualTo(
      Id produtoID) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: produtoID,
        upper: produtoID,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterWhereClause> produtoIDNotEqualTo(
      Id produtoID) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: produtoID, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: produtoID, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: produtoID, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: produtoID, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Produto, Produto, QAfterWhereClause> produtoIDGreaterThan(
      Id produtoID,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: produtoID, includeLower: include),
      );
    });
  }

  QueryBuilder<Produto, Produto, QAfterWhereClause> produtoIDLessThan(
      Id produtoID,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: produtoID, includeUpper: include),
      );
    });
  }

  QueryBuilder<Produto, Produto, QAfterWhereClause> produtoIDBetween(
    Id lowerProdutoID,
    Id upperProdutoID, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerProdutoID,
        includeLower: includeLower,
        upper: upperProdutoID,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ProdutoQueryFilter
    on QueryBuilder<Produto, Produto, QFilterCondition> {
  QueryBuilder<Produto, Produto, QAfterFilterCondition> addAoCarrinhoEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addAoCarrinho',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> nomeDoProdutoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nomeDoProduto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      nomeDoProdutoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nomeDoProduto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> nomeDoProdutoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nomeDoProduto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> nomeDoProdutoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nomeDoProduto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> nomeDoProdutoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nomeDoProduto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> nomeDoProdutoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nomeDoProduto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> nomeDoProdutoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nomeDoProduto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> nomeDoProdutoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nomeDoProduto',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> nomeDoProdutoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nomeDoProduto',
        value: '',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition>
      nomeDoProdutoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nomeDoProduto',
        value: '',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> precoEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preco',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> precoGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'preco',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> precoLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'preco',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> precoBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'preco',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> produtoCompradoEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'produtoComprado',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> produtoIDEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'produtoID',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> produtoIDGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'produtoID',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> produtoIDLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'produtoID',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> produtoIDBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'produtoID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> quantidadeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantidade',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> quantidadeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantidade',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> quantidadeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantidade',
        value: value,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> quantidadeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantidade',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> unidadeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unidade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> unidadeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unidade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> unidadeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unidade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> unidadeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unidade',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> unidadeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unidade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> unidadeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unidade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> unidadeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unidade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> unidadeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unidade',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> unidadeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unidade',
        value: '',
      ));
    });
  }

  QueryBuilder<Produto, Produto, QAfterFilterCondition> unidadeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unidade',
        value: '',
      ));
    });
  }
}

extension ProdutoQueryObject
    on QueryBuilder<Produto, Produto, QFilterCondition> {}

extension ProdutoQueryLinks
    on QueryBuilder<Produto, Produto, QFilterCondition> {}

extension ProdutoQuerySortBy on QueryBuilder<Produto, Produto, QSortBy> {
  QueryBuilder<Produto, Produto, QAfterSortBy> sortByAddAoCarrinho() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addAoCarrinho', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByAddAoCarrinhoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addAoCarrinho', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByNomeDoProduto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nomeDoProduto', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByNomeDoProdutoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nomeDoProduto', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByPreco() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preco', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByPrecoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preco', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByProdutoComprado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'produtoComprado', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByProdutoCompradoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'produtoComprado', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByQuantidade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantidade', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByQuantidadeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantidade', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByUnidade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unidade', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> sortByUnidadeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unidade', Sort.desc);
    });
  }
}

extension ProdutoQuerySortThenBy
    on QueryBuilder<Produto, Produto, QSortThenBy> {
  QueryBuilder<Produto, Produto, QAfterSortBy> thenByAddAoCarrinho() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addAoCarrinho', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByAddAoCarrinhoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addAoCarrinho', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByNomeDoProduto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nomeDoProduto', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByNomeDoProdutoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nomeDoProduto', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByPreco() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preco', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByPrecoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preco', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByProdutoComprado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'produtoComprado', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByProdutoCompradoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'produtoComprado', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByProdutoID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'produtoID', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByProdutoIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'produtoID', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByQuantidade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantidade', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByQuantidadeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantidade', Sort.desc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByUnidade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unidade', Sort.asc);
    });
  }

  QueryBuilder<Produto, Produto, QAfterSortBy> thenByUnidadeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unidade', Sort.desc);
    });
  }
}

extension ProdutoQueryWhereDistinct
    on QueryBuilder<Produto, Produto, QDistinct> {
  QueryBuilder<Produto, Produto, QDistinct> distinctByAddAoCarrinho() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addAoCarrinho');
    });
  }

  QueryBuilder<Produto, Produto, QDistinct> distinctByNomeDoProduto(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nomeDoProduto',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Produto, Produto, QDistinct> distinctByPreco() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'preco');
    });
  }

  QueryBuilder<Produto, Produto, QDistinct> distinctByProdutoComprado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'produtoComprado');
    });
  }

  QueryBuilder<Produto, Produto, QDistinct> distinctByQuantidade() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantidade');
    });
  }

  QueryBuilder<Produto, Produto, QDistinct> distinctByUnidade(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unidade', caseSensitive: caseSensitive);
    });
  }
}

extension ProdutoQueryProperty
    on QueryBuilder<Produto, Produto, QQueryProperty> {
  QueryBuilder<Produto, int, QQueryOperations> produtoIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'produtoID');
    });
  }

  QueryBuilder<Produto, bool, QQueryOperations> addAoCarrinhoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addAoCarrinho');
    });
  }

  QueryBuilder<Produto, String, QQueryOperations> nomeDoProdutoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nomeDoProduto');
    });
  }

  QueryBuilder<Produto, double, QQueryOperations> precoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'preco');
    });
  }

  QueryBuilder<Produto, bool, QQueryOperations> produtoCompradoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'produtoComprado');
    });
  }

  QueryBuilder<Produto, int, QQueryOperations> quantidadeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantidade');
    });
  }

  QueryBuilder<Produto, String, QQueryOperations> unidadeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unidade');
    });
  }
}

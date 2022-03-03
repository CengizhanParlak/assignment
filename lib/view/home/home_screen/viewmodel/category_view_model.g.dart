// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoryViewModel on _CategoryViewModelBase, Store {
  Computed<bool>? _$isCategoriesLoadedComputed;

  @override
  bool get isCategoriesLoaded => (_$isCategoriesLoadedComputed ??=
          Computed<bool>(() => super.isCategoriesLoaded,
              name: '_CategoryViewModelBase.isCategoriesLoaded'))
      .value;
  Computed<bool>? _$isCategoriesEmptyComputed;

  @override
  bool get isCategoriesEmpty => (_$isCategoriesEmptyComputed ??= Computed<bool>(
          () => super.isCategoriesEmpty,
          name: '_CategoryViewModelBase.isCategoriesEmpty'))
      .value;

  final _$categoriesAtom = Atom(name: '_CategoryViewModelBase.categories');

  @override
  List<Category>? get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(List<Category>? value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  final _$_CategoryViewModelBaseActionController =
      ActionController(name: '_CategoryViewModelBase');

  @override
  void fetchCategories() {
    final _$actionInfo = _$_CategoryViewModelBaseActionController.startAction(
        name: '_CategoryViewModelBase.fetchCategories');
    try {
      return super.fetchCategories();
    } finally {
      _$_CategoryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
categories: ${categories},
isCategoriesLoaded: ${isCategoriesLoaded},
isCategoriesEmpty: ${isCategoriesEmpty}
    ''';
  }
}

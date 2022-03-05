// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoryViewModel on _CategoryViewModelBase, Store {
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

  final _$selectedCategoryIndexAtom =
      Atom(name: '_CategoryViewModelBase.selectedCategoryIndex');

  @override
  int get selectedCategoryIndex {
    _$selectedCategoryIndexAtom.reportRead();
    return super.selectedCategoryIndex;
  }

  @override
  set selectedCategoryIndex(int value) {
    _$selectedCategoryIndexAtom.reportWrite(value, super.selectedCategoryIndex,
        () {
      super.selectedCategoryIndex = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_CategoryViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
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
selectedCategoryIndex: ${selectedCategoryIndex},
isLoading: ${isLoading},
isCategoriesEmpty: ${isCategoriesEmpty}
    ''';
  }
}

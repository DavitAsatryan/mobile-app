// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ServiceState on _ServiceState, Store {
  Computed<bool>? _$shouldSearchOverlayBeVisibleComputed;

  @override
  bool get shouldSearchOverlayBeVisible =>
      (_$shouldSearchOverlayBeVisibleComputed ??= Computed<bool>(
              () => super.shouldSearchOverlayBeVisible,
              name: '_ServiceState.shouldSearchOverlayBeVisible'))
          .value;
  Computed<bool>? _$shouldCategorySearchOverlayBeVisibleComputed;

  @override
  bool get shouldCategorySearchOverlayBeVisible =>
      (_$shouldCategorySearchOverlayBeVisibleComputed ??= Computed<bool>(
              () => super.shouldCategorySearchOverlayBeVisible,
              name: '_ServiceState.shouldCategorySearchOverlayBeVisible'))
          .value;

  final _$_searchTextAtom = Atom(name: '_ServiceState._searchText');

  @override
  String get _searchText {
    _$_searchTextAtom.reportRead();
    return super._searchText;
  }

  @override
  set _searchText(String value) {
    _$_searchTextAtom.reportWrite(value, super._searchText, () {
      super._searchText = value;
    });
  }

  final _$_categorySearchTextAtom =
      Atom(name: '_ServiceState._categorySearchText');

  @override
  String get _categorySearchText {
    _$_categorySearchTextAtom.reportRead();
    return super._categorySearchText;
  }

  @override
  set _categorySearchText(String value) {
    _$_categorySearchTextAtom.reportWrite(value, super._categorySearchText, () {
      super._categorySearchText = value;
    });
  }

  final _$selectedCategoryAtom = Atom(name: '_ServiceState.selectedCategory');

  @override
  CategoryModel? get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(CategoryModel? value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  final _$selectedSubCategoryModelAtom =
      Atom(name: '_ServiceState.selectedSubCategoryModel');

  @override
  CategoryModel? get selectedSubCategoryModel {
    _$selectedSubCategoryModelAtom.reportRead();
    return super.selectedSubCategoryModel;
  }

  @override
  set selectedSubCategoryModel(CategoryModel? value) {
    _$selectedSubCategoryModelAtom
        .reportWrite(value, super.selectedSubCategoryModel, () {
      super.selectedSubCategoryModel = value;
    });
  }

  final _$categoryListResponseAtom =
      Atom(name: '_ServiceState.categoryListResponse');

  @override
  CategoryListResponse? get categoryListResponse {
    _$categoryListResponseAtom.reportRead();
    return super.categoryListResponse;
  }

  @override
  set categoryListResponse(CategoryListResponse? value) {
    _$categoryListResponseAtom.reportWrite(value, super.categoryListResponse,
        () {
      super.categoryListResponse = value;
    });
  }

  final _$rootCategoryListAtom = Atom(name: '_ServiceState.rootCategoryList');

  @override
  ObservableList<RootCategoryModel> get rootCategoryList {
    _$rootCategoryListAtom.reportRead();
    return super.rootCategoryList;
  }

  @override
  set rootCategoryList(ObservableList<RootCategoryModel> value) {
    _$rootCategoryListAtom.reportWrite(value, super.rootCategoryList, () {
      super.rootCategoryList = value;
    });
  }

  final _$categoryListAtom = Atom(name: '_ServiceState.categoryList');

  @override
  ObservableList<CategoryModel> get categoryList {
    _$categoryListAtom.reportRead();
    return super.categoryList;
  }

  @override
  set categoryList(ObservableList<CategoryModel> value) {
    _$categoryListAtom.reportWrite(value, super.categoryList, () {
      super.categoryList = value;
    });
  }

  final _$filteredSearchListAtom =
      Atom(name: '_ServiceState.filteredSearchList');

  @override
  ObservableList<ServiceState> get filteredSearchList {
    _$filteredSearchListAtom.reportRead();
    return super.filteredSearchList;
  }

  @override
  set filteredSearchList(ObservableList<ServiceState> value) {
    _$filteredSearchListAtom.reportWrite(value, super.filteredSearchList, () {
      super.filteredSearchList = value;
    });
  }

  final _$getCategoriesWithServicesAsyncAction =
      AsyncAction('_ServiceState.getCategoriesWithServices');

  @override
  Future<void> getCategoriesWithServices() {
    return _$getCategoriesWithServicesAsyncAction
        .run(() => super.getCategoriesWithServices());
  }

  final _$getRootCategoryListAsyncAction =
      AsyncAction('_ServiceState.getRootCategoryList');

  @override
  Future<void> getRootCategoryList() {
    return _$getRootCategoryListAsyncAction
        .run(() => super.getRootCategoryList());
  }

  final _$getCategoryByIdAsyncAction =
      AsyncAction('_ServiceState.getCategoryById');

  @override
  Future<void> getCategoryById(int id, bool isLastLevel) {
    return _$getCategoryByIdAsyncAction
        .run(() => super.getCategoryById(id, isLastLevel));
  }

  final _$searchAsyncAction = AsyncAction('_ServiceState.search');

  @override
  Future<void> search({int? id}) {
    return _$searchAsyncAction.run(() => super.search(id: id));
  }

  final _$searchInCategoriesAsyncAction =
      AsyncAction('_ServiceState.searchInCategories');

  @override
  Future<void> searchInCategories({int? id}) {
    return _$searchInCategoriesAsyncAction
        .run(() => super.searchInCategories(id: id));
  }

  final _$_ServiceStateActionController =
      ActionController(name: '_ServiceState');

  @override
  void setSearchText(String value) {
    final _$actionInfo = _$_ServiceStateActionController.startAction(
        name: '_ServiceState.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_ServiceStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategorySearchText(String value) {
    final _$actionInfo = _$_ServiceStateActionController.startAction(
        name: '_ServiceState.setCategorySearchText');
    try {
      return super.setCategorySearchText(value);
    } finally {
      _$_ServiceStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedCategory: ${selectedCategory},
selectedSubCategoryModel: ${selectedSubCategoryModel},
categoryListResponse: ${categoryListResponse},
rootCategoryList: ${rootCategoryList},
categoryList: ${categoryList},
filteredSearchList: ${filteredSearchList},
shouldSearchOverlayBeVisible: ${shouldSearchOverlayBeVisible},
shouldCategorySearchOverlayBeVisible: ${shouldCategorySearchOverlayBeVisible}
    ''';
  }
}

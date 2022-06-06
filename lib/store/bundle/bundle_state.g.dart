// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bundle_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BundleState on _BundleState, Store {
  Computed<bool>? _$shouldSearchOverlayBeVisibleComputed;

  @override
  bool get shouldSearchOverlayBeVisible =>
      (_$shouldSearchOverlayBeVisibleComputed ??= Computed<bool>(
              () => super.shouldSearchOverlayBeVisible,
              name: '_BundleState.shouldSearchOverlayBeVisible'))
          .value;

  final _$_searchTextAtom = Atom(name: '_BundleState._searchText');

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

  final _$bundleListAtom = Atom(name: '_BundleState.bundleList');

  @override
  ObservableList<BundleModel> get bundleList {
    _$bundleListAtom.reportRead();
    return super.bundleList;
  }

  @override
  set bundleList(ObservableList<BundleModel> value) {
    _$bundleListAtom.reportWrite(value, super.bundleList, () {
      super.bundleList = value;
    });
  }

  final _$filteredBundleListAtom =
      Atom(name: '_BundleState.filteredBundleList');

  @override
  ObservableList<BundleModel> get filteredBundleList {
    _$filteredBundleListAtom.reportRead();
    return super.filteredBundleList;
  }

  @override
  set filteredBundleList(ObservableList<BundleModel> value) {
    _$filteredBundleListAtom.reportWrite(value, super.filteredBundleList, () {
      super.filteredBundleList = value;
    });
  }

  final _$selectedBundleAtom = Atom(name: '_BundleState.selectedBundle');

  @override
  BundleModel? get selectedBundle {
    _$selectedBundleAtom.reportRead();
    return super.selectedBundle;
  }

  @override
  set selectedBundle(BundleModel? value) {
    _$selectedBundleAtom.reportWrite(value, super.selectedBundle, () {
      super.selectedBundle = value;
    });
  }

  final _$getBundlesAsyncAction = AsyncAction('_BundleState.getBundles');

  @override
  Future<void> getBundles() {
    return _$getBundlesAsyncAction.run(() => super.getBundles());
  }

  final _$getBundleByIDAsyncAction = AsyncAction('_BundleState.getBundleByID');

  @override
  Future<void> getBundleByID(int id) {
    return _$getBundleByIDAsyncAction.run(() => super.getBundleByID(id));
  }

  final _$searchAsyncAction = AsyncAction('_BundleState.search');

  @override
  Future<void> search() {
    return _$searchAsyncAction.run(() => super.search());
  }

  final _$_BundleStateActionController = ActionController(name: '_BundleState');

  @override
  void setSearchText(String value) {
    final _$actionInfo = _$_BundleStateActionController.startAction(
        name: '_BundleState.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_BundleStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
bundleList: ${bundleList},
filteredBundleList: ${filteredBundleList},
selectedBundle: ${selectedBundle},
shouldSearchOverlayBeVisible: ${shouldSearchOverlayBeVisible}
    ''';
  }
}

import 'package:cursus_app/data/repository/bundle_repository.dart';
import 'package:cursus_app/model/bundle/bundle_model.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mobx/mobx.dart';

part 'bundle_state.g.dart';

class BundleState = _BundleState with _$BundleState;

abstract class _BundleState with Store {
  final BundleRepository bundleRepository = BundleRepository();
  final StoreState storeState = StoreState();
  final StoreState searchState = StoreState();

  _BundleState() {
    bundleController.addPageRequestListener((_) {
      getBundles();
    });

    searcgController.addPageRequestListener((_) {
      search();
    });
  }

  static const fetchLimit = 20;

  PagingController<int, BundleModel> bundleController =
      PagingController<int, BundleModel>(firstPageKey: 0);
  PagingController<int, BundleModel> searcgController =
      PagingController<int, BundleModel>(firstPageKey: 0);

  int bundlesOffset = 0;

  @observable
  String _searchText = '';

  @observable
  ObservableList<BundleModel> bundleList = <BundleModel>[].asObservable();

  @observable
  ObservableList<BundleModel> filteredBundleList =
      <BundleModel>[].asObservable();

  @observable
  BundleModel? selectedBundle;

  @action
  void setSearchText(String value) => _searchText = value;

  @computed
  bool get shouldSearchOverlayBeVisible => _searchText.length >= 1;

  @action
  Future<void> getBundles() async {
    try {
      storeState.changeState(StoreStates.loading);
      bundleList.clear();
      List<BundleModel> bundles = await bundleRepository.getBundles();
      bundleList.addAll(bundles);
      storeState.changeState(StoreStates.success);
    } catch (e) {
      storeState.setErrorMessage(e.toString());
      storeState.changeState(StoreStates.error);
    }
  }

  @action
  Future<void> getBundleByID(int id) async {
    try {
      storeState.changeState(StoreStates.loading);
      selectedBundle = await bundleRepository.getBundlesById(id);
      storeState.changeState(StoreStates.success);
    } catch (e) {
      storeState.setErrorMessage(e.toString());
      storeState.changeState(StoreStates.error);
    }
  }

  @action
  Future<void> search() async {
    if (shouldSearchOverlayBeVisible) {
      try {
        searchState.changeState(StoreStates.loading);
        List<BundleModel> searchResult = await bundleRepository.search(
          offset: bundlesOffset,
          limit: fetchLimit,
          searchKeyword: _searchText,
        );
        print('mmmmmmmmm ${searchResult.length}');
        final isLastPage = searchResult.length < fetchLimit;
        if (isLastPage) {
          searcgController.appendLastPage(searchResult);
        } else {
          bundlesOffset += searchResult.length;
          searcgController.appendPage(searchResult, bundlesOffset);
        }
        if (searchResult.isEmpty) {
          searchState.changeState(StoreStates.empty);
        } else {
          searchState.changeState(StoreStates.success);
        }
      } catch (e) {
        searchState.setErrorMessage(e.toString());
        searchState.changeState(StoreStates.error);
      }
    }
  }
}

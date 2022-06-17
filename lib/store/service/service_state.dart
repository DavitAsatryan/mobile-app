import 'package:cursus_app/data/repository/service_repository.dart';
import 'package:cursus_app/model/category/category_model.dart';
import 'package:cursus_app/model/category_list_response/category_list_response.dart';
import 'package:cursus_app/model/root_category/root_category_model.dart';
import 'package:cursus_app/model/service/service_model.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:cursus_app/values/values.dart';
import 'package:dio/dio.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mobx/mobx.dart';

part 'service_state.g.dart';

class ServiceState = _ServiceState with _$ServiceState;

abstract class _ServiceState with Store {
  final ServiceRepository serviceRepository = ServiceRepository();
  final StoreState storeState = StoreState();
  final StoreState searchState = StoreState();

  _ServiceState() {
    searchController.addPageRequestListener((_) {
    });

    servicesController.addPageRequestListener((_) {
      getRootCategoryList();
    });

    categorySearchController.addPageRequestListener((_) {
      searchInCategories();
    });
  }

  static const fetchLimit = 20;

  PagingController<int, ServiceModel> searchController =
      PagingController<int, ServiceModel>(firstPageKey: 0);

  PagingController<int, CategoryModel> categorySearchController =
      PagingController<int, CategoryModel>(firstPageKey: 0);

  PagingController<int, CategoryModel> servicesController =
      PagingController<int, CategoryModel>(firstPageKey: 0);

  int searchOffset = 0;
  int servicesOffset = 0;

  @observable
  String _searchText = '';

  @observable
  String _categorySearchText = '';

  @action
  void setSearchText(String value) => _searchText = value;

  @action
  void setCategorySearchText(String value) => _categorySearchText = value;

  @computed
  bool get shouldSearchOverlayBeVisible => _searchText.length >= 1;

  @computed
  bool get shouldCategorySearchOverlayBeVisible => _categorySearchText.length >= 1;

  List categoryBackgroundColorList = [];

  @observable
  CategoryModel? selectedCategory;

  @observable
  CategoryModel? selectedSubCategoryModel;

  @observable
  CategoryListResponse? categoryListResponse;

  @observable
  ObservableList<RootCategoryModel> rootCategoryList =
      <RootCategoryModel>[].asObservable();

  @observable
  ObservableList<CategoryModel> categoryList = <CategoryModel>[].asObservable();

  @observable
  ObservableList<ServiceState> filteredSearchList =
      <ServiceState>[].asObservable();

  final List backgroundGradientList = [];

  @action
  Future<void> getCategoriesWithServices() async {
    try {
      storeState.changeState(StoreStates.loading);
      List<CategoryModel> categories =
          await serviceRepository.getCategoriesWithServices(
        offset: servicesOffset,
        limit: fetchLimit,
      );
      servicesController.refresh();
      final isLastPage = categories.length < fetchLimit;
      if (isLastPage) {
        servicesController.appendLastPage(categories);
      } else {
        servicesOffset += categories.length;
        servicesController.appendPage(categories, servicesOffset);
      }
      storeState.changeState(StoreStates.success);
    } catch (e) {
      storeState.setErrorMessage(e.toString());
      storeState.changeState(StoreStates.error);
    }
  }

  @action
  Future<void> getRootCategoryList() async {
    try {
      storeState.state = StoreStates.loading;
      final res = await serviceRepository.getRootCategories();
      rootCategoryList.clear();
      rootCategoryList.addAll(res);
      for (var i = 0; i < rootCategoryList.length; i++) {
        final randomItemColor = (Lists.menuItemColors..shuffle()).first;
        categoryBackgroundColorList.add(randomItemColor);
      }
      storeState.state = StoreStates.success;
    } on DioError {
    } finally {
      storeState.state = StoreStates.error;
    }
  }

  @action
  Future<void> getCategoryById(int id, bool isLastLevel) async {
    storeState.changeState(StoreStates.loading);
    try {
      if (isLastLevel) {
        selectedSubCategoryModel =
            await serviceRepository.getCategoriesById(id);
        print('isLastLevel');
      } else {
        selectedCategory = await serviceRepository.getCategoriesById(id);
        for (var i = 0; i < selectedCategory!.categories!.length; i++) {
          final randomItemColor = (Lists.gradientList..shuffle()).first;
          backgroundGradientList.add(randomItemColor);
        }
        print('ppppppp $backgroundGradientList');
      }
      storeState.changeState(StoreStates.success);
    } catch (e) {
      storeState.setErrorMessage(e.toString());
      storeState.changeState(StoreStates.error);
    }
  }

  @action
  Future<void> search({int? id}) async {
    if (shouldSearchOverlayBeVisible) {
      try {
        searchState.changeState(StoreStates.loading);
        List<ServiceModel> searchResult = await serviceRepository.search(
          id: id,
          searchKeyword: _searchText,
        );
        searchController.refresh();

        final isLastPage = searchResult.length < fetchLimit;
        if (isLastPage) {
          searchController.appendLastPage(searchResult);
        } else {
          searchOffset += searchResult.length;
          searchController.appendPage(searchResult, servicesOffset);
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

  @action
  Future<void> searchInCategories({int? id}) async {
    if (shouldCategorySearchOverlayBeVisible) {
      try {
        searchState.changeState(StoreStates.loading);
        List<CategoryModel> categorySearchResult =
            await serviceRepository.searchInCategories(
          id: id,
          searchKeyword: _categorySearchText,
          offset: searchOffset,
          limit: fetchLimit,
        );
        print('xxxxxxx ${categorySearchResult.length}');

        final isLastPage = categorySearchResult.length < fetchLimit;
        if (isLastPage) {
          categorySearchController.appendLastPage(categorySearchResult);
        } else {
          searchOffset += categorySearchResult.length;
          categorySearchController.appendPage(categorySearchResult, servicesOffset);
        }
        if (categorySearchResult.isEmpty) {
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

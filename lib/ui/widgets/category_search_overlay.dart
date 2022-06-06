import 'package:auto_route/auto_route.dart';
import 'package:cursus_app/helpers/screen_size_accessor.dart';
import 'package:cursus_app/model/category/category_model.dart';
import 'package:cursus_app/router.gr.dart';
import 'package:cursus_app/store/service/service_state.dart';
import 'package:cursus_app/store/store_state/store_state.dart';
import 'package:cursus_app/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SearchOverlay extends StatefulWidget {
  final bool isRoot;

  const SearchOverlay({
    Key? key,
    required this.isRoot,
  }) : super(key: key);

  @override
  State<SearchOverlay> createState() => _SearchOverlayState();
}

class _SearchOverlayState extends State<SearchOverlay> {
  final serviceState = GetIt.I<ServiceState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Visibility(
        visible: serviceState.shouldCategorySearchOverlayBeVisible,
        child: Container(
          height: screenHeight(context) / 3,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: AppColors.purpleDots,
            ),
            color: AppColors.purpleDots.withOpacity(.3),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
          child: Observer(
            builder: (_) => _buildUi(),
          ),
        ),
      ),
    );
  }

  Widget _buildUi() {
    if (serviceState.searchState.state == StoreStates.success) {
      return PagedListView<int, CategoryModel>(
        pagingController: serviceState.categorySearchController,
        builderDelegate: PagedChildBuilderDelegate<CategoryModel>(
          itemBuilder: (context, item, index) => _CategoryTile(
            categoryModel: item, isRoot: widget.isRoot,
          ),
        ),
      );
    } else if (serviceState.searchState.state == StoreStates.empty) {
      return Center(
        child: Text(
          'No Services Found',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      );
    } else if (serviceState.searchState.state == StoreStates.error) {
      return Center(
        child: Text(
          'Something went wrong!!',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: AppColors.purpleLight,
        ),
      );
    }
  }
}

class _CategoryTile extends StatefulWidget {
  final CategoryModel categoryModel;
  final bool isRoot;

  const _CategoryTile({
    required this.categoryModel,
    required this.isRoot,
    Key? key,
  }) : super(key: key);

  @override
  State<_CategoryTile> createState() => _CategoryTileState();
}

class _CategoryTileState extends State<_CategoryTile> {
  final serviceState = GetIt.I<ServiceState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {
              serviceState.setCategorySearchText(''),
              if (widget.isRoot)
                {
                  AutoRouter.of(context).push(
                      SubCategoryRoute(categoryId: widget.categoryModel.id)),
                }
              else
                {
                  AutoRouter.of(context).push(
                      LaboratoryRoute(subCategoryId: widget.categoryModel.id)),
                }
            },
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.categoryModel.name,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
              Divider(
                thickness: 1.5,
                color: AppColors.primaryText1.withOpacity(.5),
              )
            ],
          ),
        ));
  }
}

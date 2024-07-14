import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_dock_test/core/helper/helper.dart';
import 'package:tech_dock_test/core/model/search_recipe_response.dart';
import 'package:tech_dock_test/core/routes/routes.dart';
import 'package:tech_dock_test/core/theme/colors.dart';
import 'package:tech_dock_test/core/theme/fonts.dart';
import 'package:tech_dock_test/core/widgets/custom_list_tile.dart';
import 'package:tech_dock_test/core/widgets/custom_loader.dart';
import 'package:tech_dock_test/core/widgets/search_widget.dart';
import 'package:tech_dock_test/feature/searchResult/controller/search_result_controller.dart';

class SearchResultView extends GetView<SearchResultController> {
  const SearchResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchWidget(
              textEditingController: controller.searchQuery,
              onSubmitted: (p0) {
                controller.getSearchResult(query: controller.searchQuery.text);
              },
            ),
            _buildResultText(),
            Obx(() => Flexible(
                child: controller.isLoading.value
                    ? customLoader()
                    : _buildSearchResultList()))
          ],
        ),
      ),
    );
  }

  _buildResultText() {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Obx(() => controller.searchResultList.isNotEmpty
            ? Text(
                "${controller.totalResult.value.toString()} result",
                style: TextStyle(
                    fontFamily: FF.ubuntu,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: grey),
              )
            : const SizedBox()),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  _buildSearchResultList() {
    return ListView.separated(
      itemCount: controller.searchResultList.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        SearchResultList data = controller.searchResultList[index];
        return CustomListTile(
          data: data,
          onTap: () => Get.toNamed(Routes.showRecipe, arguments: [
            {
              'name': data.title ?? '',
              'id': data.id ?? 0,
              'image': data.image ?? ''
            }
          ]),
          onFavPressed: () {
            addToFavourite(data: data, list: controller.searchResultList);
          },
        );
      },
    );
  }
}

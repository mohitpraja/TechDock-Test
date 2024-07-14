import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_dock_test/core/model/search_recipe_response.dart';
import 'package:tech_dock_test/core/theme/colors.dart';
import 'package:tech_dock_test/core/theme/fonts.dart';
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
            ),
            _buildResultText(),
            Obx(() => Flexible(
                child: controller.isLoading.value
                    ?  customLoader()
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
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemBuilder: (context, index) {
        SearchResultList data = controller.searchResultList[index];
        return Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: data.image ?? '',
                width: 100,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Text(
              data.title ?? '',
              style: TextStyle(
                fontSize: 16,
                fontFamily: FF.lato,
                color: grey,
              ),
            )),
            IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.heart))
          ],
        );
      },
    );
  }
}

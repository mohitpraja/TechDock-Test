import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_dock_test/core/model/category_list_response.dart';
import 'package:tech_dock_test/core/model/discover_recipe_response.dart';
import 'package:tech_dock_test/core/routes/routes.dart';
import 'package:tech_dock_test/core/theme/colors.dart';
import 'package:tech_dock_test/core/theme/fonts.dart';
import 'package:tech_dock_test/core/widgets/search_widget.dart';
import 'package:tech_dock_test/feature/home/controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope!.unfocus(),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          margin: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // ======================= SEARCH BAR ========================
                _buildSearchBar(),
                // ======================= CATEGORY LIST ========================
                _buildCategoryList(),
                // ======================= DISCOVER RECIPE ========================
                _buildDiscoverRecipe(),
                // ======================= STATIC CARD ========================
                _buildStaticCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      surfaceTintColor: transparent,
      actions: [
        IconButton(
            onPressed: () {
              controller.getDiscoverRecipe();
            },
            icon: Icon(
              CupertinoIcons.heart_fill,
              color: red,
            ))
      ],
    );
  }

  Widget _buildSearchBar() {
    return SearchWidget(
      textEditingController: controller.searchText,
      onSubmitted: (p0) {
        Get.toNamed(Routes.searchResult,
            arguments: [controller.searchText.text]);
        controller.searchText.clear();
      },
    );
  }

  Widget _buildCategoryList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        const Text(
          'Categories',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        const SizedBox(height: 10),
        Obx(() => SizedBox(
              height: 80,
              child: ListView.builder(
                  itemCount: controller.categoryList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    CategoryList data = controller.categoryList[index];
                    bool isShow = data.strCategory!.length > 10 ? false : true;
                    return !isShow
                        ? const SizedBox()
                        : Container(
                            width: 150,
                            margin: const EdgeInsets.fromLTRB(0, 8, 12, 6),
                            padding: const EdgeInsets.only(
                              top: 15,
                              left: 10,
                              right: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: const Alignment(1, -0.1),
                                colors: [
                                  Colors.primaries[index],
                                  Colors.primaries[index].withOpacity(0.5),
                                ],
                                tileMode: TileMode.repeated,
                              ),
                            ),
                            child: SizedBox(
                              height: 60,
                              child: Stack(
                                children: [
                                  Text(
                                    data.strCategory ?? '',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontFamily: FF.josefinSans,
                                        color: white.withOpacity(0.3),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Positioned(
                                      top: 7,
                                      left: 2.5,
                                      child: Text(data.strCategory ?? '',
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                              fontSize: 18.5,
                                              fontFamily: FF.josefinSans,
                                              color: white,
                                              fontWeight: FontWeight.bold))),
                                ],
                              ),
                            ),
                          );
                  }),
            )),
      ],
    );
  }

  Widget _buildStaticCard() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [primaryColor, cardColor]),
          borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex: 1, child: Image.asset('assets/images/card_image.png')),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'New addition'.toUpperCase(),
                  style: TextStyle(color: white, fontSize: 12),
                ),
                Text("Lorem Ipsum",
                    style: TextStyle(
                        color: white,
                        height: 1.5,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.3)),
                Text("Mohit Praja",
                    style: TextStyle(
                        color: white,
                        height: 2,
                        letterSpacing: 1.5,
                        fontSize: 12)),
                const SizedBox(
                  height: 10,
                ),
                CircleAvatar(
                  backgroundColor: white,
                  radius: 12,
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDiscoverRecipe() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        const Text(
          'Discover Recipe',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        const SizedBox(height: 10),
        SizedBox(
            height: 280,
            child: Obx(() => GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(8),
                  children: List.generate(6, (index) {
                    Meals data = controller.discoverRecipeList[index];
                    return Column(
                      children: [
                        Material(
                          elevation: 10,
                          shape: const CircleBorder(),
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                        data.strMealThumb ?? ''))),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data.strMeal ?? '',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    );
                  }),
                ))),
      ],
    );
  }
}

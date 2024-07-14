import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_dock_test/core/model/search_recipe_response.dart';
import 'package:tech_dock_test/core/widgets/custom_list_tile.dart';
import 'package:tech_dock_test/feature/favourites/controller/favourite_controller.dart';

class FavouriteView extends GetView<FavouriteController> {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
      ),
      body: Container(
        margin: const EdgeInsets.all(12),
        child: Column(
          children: [
            Obx(() => Expanded(
                child: controller.searchResultList.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              CupertinoIcons.heart_fill,
                              size: Get.width * 0.3,
                              color: Colors.grey,
                            ),
                            const Text(
                              "There is no favourites",
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                      )
                    : ListView.separated(
                        itemCount: controller.searchResultList.length,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) {
                          SearchResultList data =
                              controller.searchResultList[index];
                          return CustomListTile(
                            data: data,
                            onFavPressed: () {
                              controller.removeFromFavourite(index: index);
                            },
                          );
                        },
                      )))
          ],
        ),
      ),
    );
  }
}

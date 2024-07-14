import 'dart:convert';

import 'package:get/get.dart';
import 'package:tech_dock_test/core/helper/helper.dart';
import 'package:tech_dock_test/core/model/search_recipe_response.dart';

class FavouriteController extends GetxController {
  RxList<SearchResultList> searchResultList = <SearchResultList>[].obs;

  @override
  void onInit() {
    getFavouriteUserList();
    super.onInit();
  }

  getFavouriteUserList() async {
    if (appPrefs.favouriteList != '') {
      searchResultList.value = List<SearchResultList>.from(
          jsonDecode(appPrefs.favouriteList)
              .map((x) => SearchResultList.fromJson(x))).reversed.toList();
      searchResultList.refresh();
    } else {
      searchResultList.value = [];
    }
  }

  removeFromFavourite({required int index}) {
    searchResultList.removeAt(index);
    appPrefs.favouriteList = jsonEncode(searchResultList);

    searchResultList.refresh();
    showSnackBar(msg: 'Remove from favourites');
  }
}

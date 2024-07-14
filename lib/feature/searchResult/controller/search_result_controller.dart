import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tech_dock_test/core/helper/helper.dart';
import 'package:tech_dock_test/core/model/search_recipe_response.dart';
import 'package:tech_dock_test/service/api_service.dart';

class SearchResultController extends GetxController {
  RxList<SearchResultList> searchResultList = <SearchResultList>[].obs;
  RxInt totalResult = 0.obs;
  RxBool isLoading = false.obs;

  TextEditingController searchQuery =
      TextEditingController(text: Get.arguments[0]);

  @override
  void onInit() {
    isLoading.value = true;
    getSearchResult(query: searchQuery.text);
    super.onInit();
  }

  getSearchResult({required String query}) async {
    final result = await ApiService.searchRecipe(query: query);
    if (result != null) {
      List<SearchResultList> localData = appPrefs.favouriteList != ''
          ? List<SearchResultList>.from(jsonDecode(appPrefs.favouriteList)
              .map((x) => SearchResultList.fromJson(x)))
          : [];
      List<SearchResultList>? searchDataList = result.searchResultList;

      searchDataList!.removeWhere((res) =>
          localData.any((localUserData) => localUserData.id == res.id));
      searchResultList.clear();
      searchResultList.addAll(localData);
      searchResultList.addAll(searchDataList);
      searchResultList.refresh();
      totalResult.value = result.totalResults!;
      isLoading.value = false;
    } else {
      isLoading.value = false;
    }
  }
}

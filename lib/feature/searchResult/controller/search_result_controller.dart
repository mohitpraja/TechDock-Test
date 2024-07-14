import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tech_dock_test/core/model/search_recipe_response.dart';
import 'package:tech_dock_test/service/api_service.dart';

class SearchResultController extends GetxController {
  RxList<SearchResultList> searchResultList = <SearchResultList>[].obs;
  RxInt totalResult = 0.obs;
  RxBool isLoading = false.obs;

  TextEditingController searchQuery = TextEditingController(text: Get.arguments[0]);

  @override
  void onInit() {
    isLoading.value = true;
    getSearchResult();
    super.onInit();
  }

  getSearchResult() async {
    final result = await ApiService.searchRecipe(query: searchQuery.text);
    if (result != null) {
      searchResultList.value = result.searchResultList!;
      totalResult.value = result.totalResults!;
      isLoading.value = false;
    } else {
      isLoading.value = false;
    }
  }
}

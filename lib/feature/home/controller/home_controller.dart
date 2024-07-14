import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tech_dock_test/core/model/category_list_response.dart';
import 'package:tech_dock_test/core/model/discover_recipe_response.dart';
import 'package:tech_dock_test/service/api_service.dart';

class HomeController extends GetxController {
  RxList<Meals> discoverRecipeList = <Meals>[].obs;
  RxList<CategoryList> categoryList = <CategoryList>[].obs;

  RxBool isLoading = false.obs;

  TextEditingController searchText = TextEditingController();

  @override
  Future<void> onInit() async {
    isLoading.value = true;
    await getDiscoverRecipe();
    await getCategoryList();
    super.onInit();
  }

  getDiscoverRecipe() async {
    final response = await ApiService.getDiscoverRecipe();
    if (response != null) {
      discoverRecipeList.value = response.meals!;
    }
  }

  getCategoryList() async {
    final response = await ApiService.getCategoryList();
    if (response != null) {
      categoryList.value = response.categoryList!;
    }
    isLoading.value = false;
  }
}

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:tech_dock_test/core/model/category_list_response.dart';
import 'package:tech_dock_test/core/model/discover_recipe_response.dart';
import 'package:tech_dock_test/core/model/search_recipe_response.dart';
import 'package:tech_dock_test/service/url_constant.dart';

class ApiService {
  static Dio dio = Dio();
  static Dio spoonacularDio = Dio(BaseOptions(
      headers: {"Content-Type": "application/json", "x-api-key": apiKey}));
  static String apiKey = 'bc1ca8ab9c7b4ab1b4291137c736d211';

  static Future<DiscoverRecipeResponse?> getDiscoverRecipe() async {
    try {
      Response response = await dio.get(Urls.discoverRecipe);
      return DiscoverRecipeResponse.fromJson(response.data);
    } catch (e) {
      log("error : $e");
    }
    return null;
  }

  static Future<CategoryListResponse?> getCategoryList() async {
    try {
      Response response = await dio.get(Urls.categoryList);
      return CategoryListResponse.fromJson(response.data);
    } catch (e) {
      log("error : $e");
    }
    return null;
  }

  static Future<SearchRecipeResponse?> searchRecipe(
      {required String query}) async {
    try {
      Response response = await spoonacularDio.get("${Urls.searchRecipe}$query");
      return SearchRecipeResponse.fromJson(response.data);
    } catch (e) {
      log("error : $e");
    }
    return null;
  }
}

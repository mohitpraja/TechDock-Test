import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:tech_dock_test/core/model/category_list_response.dart';
import 'package:tech_dock_test/core/model/discover_recipe_response.dart';
import 'package:tech_dock_test/core/model/recipe_ingredient_response.dart';
import 'package:tech_dock_test/core/model/recipe_instruction_response.dart';
import 'package:tech_dock_test/core/model/recipe_nutrition_response.dart';
import 'package:tech_dock_test/core/model/search_recipe_response.dart';
import 'package:tech_dock_test/service/hive/apiCaching/api_cache_helper.dart';
import 'package:tech_dock_test/service/url_constant.dart';

class ApiService {

  static Future<DiscoverRecipeResponse?> getDiscoverRecipe() async {
    try {
      Response response = await ApiCacheHelper.getJsonResponse(endpoint: Urls.discoverRecipe);
      return DiscoverRecipeResponse.fromJson(jsonDecode(response.data));
    } catch (e) {
      log("error : $e");
    }
    return null;
  }

  static Future<CategoryListResponse?> getCategoryList() async {
    try {
      Response response =  await ApiCacheHelper.getJsonResponse(endpoint: Urls.categoryList);
      return CategoryListResponse.fromJson(jsonDecode(response.data));
    } catch (e) {
      log("error : $e");
    }
    return null;
  }

  static Future<SearchRecipeResponse?> searchRecipe(
      {required String query}) async {
    try {
      Response response =  await ApiCacheHelper.getJsonResponse(endpoint:"${Urls.searchRecipe}$query");
      return SearchRecipeResponse.fromJson(jsonDecode(response.data));
    } catch (e) {
      log("error : $e");
    }
    return null;
  }
  
  static Future<RecipeNutritionResponse?> getRecipeNutrition(
      {required int id}) async {
    try {
      Response response =  await ApiCacheHelper.getJsonResponse(endpoint:Urls.recipeNutrition(id));
      return RecipeNutritionResponse.fromJson(jsonDecode(response.data));
    } catch (e) {
      log("error : $e");
    }
    return null;
  }
  static Future<RecipeIngredientResponse?> getRecipeIngredient(
      {required int id}) async {
    try {
      Response response =  await ApiCacheHelper.getJsonResponse(endpoint:Urls.recipeIngredient(id));
      return RecipeIngredientResponse.fromJson(jsonDecode(response.data));
    } catch (e) {
      log("error : $e");
    }
    return null;
  }
  static Future<List<RecipeInstructionResponse>?> getRecipeInstruction(
      {required int id}) async {
    try {
      Response response =  await ApiCacheHelper.getJsonResponse(endpoint:Urls.recipeInstruction(id));
      
      return recipeInstructionResponseFromJson(response.data);
    } catch (e) {
      log("error : $e");
    }
    return null;
  }
  static List<RecipeInstructionResponse> recipeInstructionResponseFromJson(String str) => List<RecipeInstructionResponse>.from(json.decode(str).map((x) => RecipeInstructionResponse.fromJson(x)));
}

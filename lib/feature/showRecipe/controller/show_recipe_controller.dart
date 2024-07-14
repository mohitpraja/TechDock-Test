import 'package:get/get.dart';
import 'package:tech_dock_test/core/model/recipe_ingredient_response.dart';
import 'package:tech_dock_test/core/model/recipe_instruction_response.dart';
import 'package:tech_dock_test/core/model/recipe_nutrition_response.dart';
import 'package:tech_dock_test/service/api_service.dart';

class ShowRecipeController extends GetxController {
  RxList<Nutrients> nutrientsList = <Nutrients>[].obs;
  RxList<Ingredients> ingredientList = <Ingredients>[].obs;
  RxList<Steps> instructionList = <Steps>[].obs;

  RxBool isLoading = false.obs;

  String recipeName = Get.arguments[0]['name'];
  String recipeImage = Get.arguments[0]['image'];

  int recipeId = Get.arguments[0]['id'];

  @override
  Future<void> onInit() async {
    isLoading.value = true;
    await getRecipeNutrition();
    await getRecipeIngredient();
    await getRecipeInstruction();
    super.onInit();
  }

  getRecipeNutrition() async {
    final result = await ApiService.getRecipeNutrition(id: recipeId);
    if (result != null) {
      nutrientsList.value = result.nutrients!;
    }
  }
  getRecipeIngredient() async {
    final result = await ApiService.getRecipeIngredient(id: recipeId);
    if (result != null) {
      ingredientList.value = result.ingredients!;
    }
  }
  getRecipeInstruction() async {
    final result = await ApiService.getRecipeInstruction(id: recipeId);
    isLoading.value = false;
    if (result != null) {
      instructionList.value = result[0].steps!;
    }
  }
}

import 'package:get/get.dart';
import 'package:tech_dock_test/feature/showRecipe/controller/show_recipe_controller.dart';

class ShowRecipeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ShowRecipeController());
  }
}
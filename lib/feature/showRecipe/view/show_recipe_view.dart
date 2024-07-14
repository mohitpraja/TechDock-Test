import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_dock_test/core/helper/helper.dart';
import 'package:tech_dock_test/core/model/recipe_ingredient_response.dart';
import 'package:tech_dock_test/core/model/recipe_instruction_response.dart';
import 'package:tech_dock_test/core/model/recipe_nutrition_response.dart';
import 'package:tech_dock_test/core/theme/colors.dart';
import 'package:tech_dock_test/core/widgets/custom_loader.dart';
import 'package:tech_dock_test/feature/showRecipe/controller/show_recipe_controller.dart';

class ShowRecipeView extends GetView<ShowRecipeController> {
  const ShowRecipeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Obx(() => controller.isLoading.value
            ? SizedBox(
                height: Get.height * 0.8, child: Center(child: customLoader()))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildImagenNutrient(),
                  _buildIngredient(),
                  _buildInstruction(),
                ],
              )),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: Text(controller.recipeName),
      titleSpacing: 1,
    );
  }

  _buildImagenNutrient() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: 10,
          ),
          Material(
            elevation: 6,
            shape: const CircleBorder(),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: SizedBox(
                    height: 170,
                    width: 170,
                    child: CachedNetworkImage(
                      imageUrl: controller.recipeImage,
                      fit: BoxFit.cover,
                    ))),
          ),
          Expanded(
            child: Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: List.generate(6, (index) {
                    Nutrients data = controller.nutrientsList[index + 1];
                    bool isShow = data.name!.length > 15 ? false : true;
                    return !isShow
                        ? const SizedBox()
                        : Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                              white,
                              cardColor.withOpacity(0.1)
                            ])),
                            child: Text(
                              "${data.name} : ${data.amount} ${data.unit}",
                              style: TextStyle(color: primaryColor),
                            ),
                          );
                  }),
                )),
          )
        ],
      ),
    );
  }

  _buildIngredient() {
    return Obx(() => Container(
          color: blue.withOpacity(0.1),
          width: Get.width,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ingredients -',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children:
                    List.generate(controller.ingredientList.length, (index) {
                  Ingredients data = controller.ingredientList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            data.name!.toCapitalized(),
                            style: TextStyle(color: blue),
                          ),
                        ),
                        Text(
                          "${data.amount!.metric!.value} ${data.amount!.metric!.unit}",
                          style: TextStyle(color: blue),
                        )
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ));
  }

  _buildInstruction() {
    return Obx(() => Container(
          margin: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Instructions -',
                style: TextStyle(fontSize: 18),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    List.generate(controller.instructionList.length, (index) {
                  Steps data = controller.instructionList[index];
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      "${data.number}. ${data.step}",
                      style: TextStyle(color: grey),
                    ),
                  );
                }),
              )
            ],
          ),
        ));
  }
}

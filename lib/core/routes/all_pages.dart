import 'package:get/get.dart';
import 'package:tech_dock_test/core/routes/routes.dart';
import 'package:tech_dock_test/feature/favourites/binding/favourite_binding.dart';
import 'package:tech_dock_test/feature/favourites/view/favourite_view.dart';
import 'package:tech_dock_test/feature/home/binding/home_binding.dart';
import 'package:tech_dock_test/feature/home/view/home_view.dart';
import 'package:tech_dock_test/feature/searchResult/binding/search_result_binding.dart';
import 'package:tech_dock_test/feature/searchResult/view/search_result_view.dart';
import 'package:tech_dock_test/feature/showRecipe/binding/show_recipe_binding.dart';
import 'package:tech_dock_test/feature/showRecipe/view/show_recipe_view.dart';

List<GetPage> allPages = <GetPage>[
  GetPage(name: Routes.home, page: () => const HomeView(),binding: HomeBinding()),
  GetPage(name: Routes.searchResult, page: () => const SearchResultView(),binding: SearchResultBinding()),
  GetPage(name: Routes.showRecipe, page: () => const ShowRecipeView(),binding: ShowRecipeBinding()),
  GetPage(name: Routes.favourites, page: () => const FavouriteView(),binding: FavouriteBinding()),
];
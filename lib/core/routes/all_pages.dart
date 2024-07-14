import 'package:get/get.dart';
import 'package:tech_dock_test/core/routes/routes.dart';
import 'package:tech_dock_test/feature/home/binding/home_binding.dart';
import 'package:tech_dock_test/feature/home/view/home_view.dart';
import 'package:tech_dock_test/feature/searchResult/binding/search_result_binding.dart';
import 'package:tech_dock_test/feature/searchResult/view/search_result_view.dart';

List<GetPage> allPages = <GetPage>[
  GetPage(name: Routes.home, page: () => const HomeView(),binding: HomeBinding()),
  GetPage(name: Routes.searchResult, page: () => const SearchResultView(),binding: SearchResultBinding()),
];
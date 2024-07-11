import 'package:get/get.dart';
import 'package:tech_dock_test/core/routes/routes.dart';
import 'package:tech_dock_test/feature/find/binding/find_binding.dart';
import 'package:tech_dock_test/feature/find/view/find_view.dart';
import 'package:tech_dock_test/feature/home/binding/home_binding.dart';
import 'package:tech_dock_test/feature/home/view/home_view.dart';

List<GetPage> allPages = <GetPage>[
  GetPage(name: Routes.home, page: () => const HomeView(),binding: HomeBinding()),
  GetPage(name: Routes.find, page: () => const FindView(),binding: FindBinding()),
];
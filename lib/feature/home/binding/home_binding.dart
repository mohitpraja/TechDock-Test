import 'package:get/get.dart';
import 'package:tech_dock_test/feature/home/controller/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
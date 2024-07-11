import 'package:get/get.dart';
import 'package:tech_dock_test/feature/find/controller/find_controller.dart';

class FindBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(FindController());
  }
}
import 'package:get/get.dart';
import 'package:tech_dock_test/feature/favourites/controller/favourite_controller.dart';

class FavouriteBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(FavouriteController());
  }
}
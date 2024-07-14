import 'package:get/get.dart';
import 'package:tech_dock_test/feature/searchResult/controller/search_result_controller.dart';

class SearchResultBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SearchResultController());
  }
}
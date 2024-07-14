import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:tech_dock_test/core/routes/all_pages.dart';
import 'package:tech_dock_test/core/routes/routes.dart';
import 'package:tech_dock_test/core/theme/colors.dart';
import 'package:tech_dock_test/core/theme/fonts.dart';
import 'package:tech_dock_test/service/hive/apiCaching/api_response_box.dart';
import 'package:tech_dock_test/service/hive/app_prefs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await AppPreferences.instance.init();
  Hive.registerAdapter(ApiResponseBoxAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TechDock Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        fontFamily: FF.alata,
        useMaterial3: true,
      ),
      getPages: allPages,
      initialRoute: Routes.home,
    );
  }
}

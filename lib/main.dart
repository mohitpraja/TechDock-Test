import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_dock_test/core/routes/all_pages.dart';
import 'package:tech_dock_test/core/routes/routes.dart';
import 'package:tech_dock_test/core/theme/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TechDock Task',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      getPages: allPages,
      initialRoute: Routes.home,
    );
  }
}
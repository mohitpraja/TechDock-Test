import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_dock_test/core/model/search_recipe_response.dart';
import 'package:tech_dock_test/service/hive/app_prefs.dart';

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

AppPreferences appPrefs = AppPreferences.instance;

showSnackBar({required String msg}) {
  ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      duration: const Duration(seconds: 1),
      backgroundColor: Colors.black,
      shape: const Border(top: BorderSide(width: 3, color: Colors.green)),
      content: Text(msg)));
}

addToFavourite(
    {required SearchResultList data, required RxList<SearchResultList> list}) {
  List temp =
      appPrefs.favouriteList != '' ? jsonDecode(appPrefs.favouriteList) : [];
  data.isFavourite = true;
  temp.add(data);
  if (!(appPrefs.favouriteList.contains(data.id.toString()))) {
    appPrefs.favouriteList = jsonEncode(temp);
    list.refresh();
    showSnackBar(msg: 'Added to favourites');
  }
}

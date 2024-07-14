import 'package:flutter/material.dart';
import 'package:tech_dock_test/core/theme/colors.dart';

customLoader() {
  return Center(
      child: CircularProgressIndicator(
    backgroundColor: cardColor,
    color: primaryColor.withOpacity(0.5),
  ));
}

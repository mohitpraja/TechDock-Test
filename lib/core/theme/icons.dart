import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_dock_test/core/theme/colors.dart';

class AppIcons {
  static Icon heartIcon = const Icon(CupertinoIcons.heart);
  static Icon heartFillIcon = Icon(CupertinoIcons.heart_fill,color: red,);
  static Icon arrowForward = const Icon(
    Icons.arrow_forward_ios,
    size: 14,
  );
  static Icon searchIcon = Icon(
    CupertinoIcons.search,
    color: grey,
  );
}

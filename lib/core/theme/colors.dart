import 'dart:math';

import 'package:flutter/material.dart';

Color primaryColor = const Color.fromARGB(255, 100, 30, 25);
Color red = Colors.red;
Color grey = Colors.black54;
Color white = Colors.white;
Color transparent = Colors.transparent;
Color cardColor = const Color(0xffD65C27);

Color getRandomColor() {
  Random random = Random();
  int red = random.nextInt(256); // 0 to 255
  int green = random.nextInt(256); // 0 to 255
  int blue = random.nextInt(256); // 0 to 255

  return Color.fromARGB(255, red, green, blue);
}

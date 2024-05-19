import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static const TextStyle title = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subtitle2 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Color(0xff0932c9),
  );
  static const TextStyle subtitle3 = TextStyle(
    fontSize: 15 ,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle body = TextStyle(
    fontSize: 16,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 14,
  );

  // input text style
  static const TextStyle input = TextStyle(
    fontSize: 16,
    color: Colors.black,
  );
  // hint text style
  static const TextStyle hint = TextStyle(
    fontSize: 16,
    color: Colors.grey,
  );
}
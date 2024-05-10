import 'package:flutter/material.dart';
import 'package:student_data_app/screen/home/home_screen.dart';
import 'package:student_data_app/screen/product/product_screen.dart';

Map<String,WidgetBuilder> app_routes = {
  "/":(context) => HomeScreen(),
  "product":(context) => ProductScreen(),
};
import 'package:flutter/material.dart';
import 'package:glue/init.dart';
import 'package:glue/src/view/app.dart';

void main() {
  runApp(const App());
}

void setup() async {
  Init.configureDependencies();
}

import 'package:flutter/material.dart';
import 'app/app.dart';
import 'app/core/services/app_service.dart';

void main() {
  AppService().start();
  runApp(const App());
}

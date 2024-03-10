import 'package:flutter/material.dart';
import 'app/app.dart';
import 'app/core/services/app_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppService().start();
  runApp(const App());
}

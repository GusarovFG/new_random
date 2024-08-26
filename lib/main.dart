import 'package:flutter/material.dart';
import 'package:new_random/presentation/Application/Application.dart';
import 'package:new_random/services/hiveService/Hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();

  runApp(const Application());
}

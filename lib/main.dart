import 'package:flutter/material.dart';

import 'core/cache/shared_preferences.dart';
import 'core/di/di.dart';
import 'steller_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await SharedPreferencesHelper.init();
  runApp(const Steller());
}

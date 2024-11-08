import 'package:flutter/material.dart';

import 'config/router/routes_name.dart';
import 'core/cache/shared_preferences.dart';
import 'core/constants/app_constants.dart';
import 'core/di/di.dart';
import 'steller_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await SharedPreferencesHelper.init();
  String? user =
      await SharedPreferencesHelper.getSecuredString(key: AppConstants.token);
  late String initRoute;
  if (user == null || user.isEmpty) {
    initRoute = RoutesName.loginScreen;
  } else {
    initRoute = RoutesName.homeScreen;
  }

  runApp(Steller(initialRoute: initRoute));
}

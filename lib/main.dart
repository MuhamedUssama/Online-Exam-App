import 'package:flutter/material.dart';

import 'core/di/di.dart';
import 'steller.dart';

void main() {
  configureDependencies();
  runApp(const Steller());
}

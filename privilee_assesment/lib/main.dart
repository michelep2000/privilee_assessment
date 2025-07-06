import 'package:flutter/material.dart';
import 'package:privilee_assesment/core/config/router/app_router.dart';
import 'package:privilee_assesment/core/config/theme/app_theme.dart';
import 'package:privilee_assesment/core/di/dependency_injection.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Privilee',
      theme: AppTheme.getTheme(),
      routerConfig: goRouter,
    );
  }
}

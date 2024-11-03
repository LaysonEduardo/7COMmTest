import 'package:flutter/material.dart';
import 'package:flutter_dev_test/src/app_module.dart';
import 'package:flutter_dev_test/src/core/utils/app_colors.dart';
import 'package:flutter_dev_test/src/core/utils/color_extension.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ModularApp(
      module: AppModule(),
      child: MaterialApp.router(
        title: 'Flutter Test',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: AppColors.brown.getMaterial(),
            accentColor: AppColors.brown,
            backgroundColor: Colors.white,
            brightness: Brightness.light,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'PlusJakartaSans',
        ),
        routerConfig: Modular.routerConfig,
      ),
    );
  }
}

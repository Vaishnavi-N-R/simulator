import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_simulator/theme/theme.dart';
import 'package:trade_simulator/screens/home_page.dart'; // Make sure to import HomePage

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: const HomePage(), // Set HomePage as the initial screen
    );
  }
}

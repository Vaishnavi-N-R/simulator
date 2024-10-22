import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:trade_simulator/constants/sizes.dart';
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
      home: AnimatedSplashScreen(
        duration: 3000,
        splash: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Lottie.asset(
                'assets/animations/splash.json',
                width: 350, // Control the width directly here
                height: 650, // Control the height directly here
                fit: BoxFit
                    .cover, // Ensures the animation fills the box properly
              ),
            )
          ],
        ),
        nextScreen: HomePage(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
      ),
    );
  }
}

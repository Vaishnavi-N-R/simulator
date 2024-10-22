import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:trade_simulator/constants/sizes.dart';
import 'package:trade_simulator/theme/theme.dart';
import 'package:trade_simulator/screens/home_page.dart';
import 'package:trade_simulator/widgets/onboarding/onboarding.dart'; // Make sure to import HomePage

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: Get.isDarkMode
                ? [
                    Colors.black,
                    Colors.grey[900]!, // Dark gradient for dark mode
                  ]
                : [
                    const Color.fromARGB(255, 240, 239, 237), // Start color of the gradient
                    Colors.black, // End color of the gradient
                  ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: AnimatedSplashScreen(
          duration: 3000,
          splash: Center(
            child: SizedBox(
              width: 350, // Set the width of the animation
              height: 350, // Set the height of the animation
              child: Lottie.asset(
                'assets/animations/splash.json',
                fit: BoxFit
                    .cover, // Ensures that the animation scales to fit within the SizedBox
              ),
            ),
          ),
          nextScreen: OnBoardingScreen(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors
              .transparent, // Set to transparent to use Container's decoration
        ),
      ),
    );
  }
}

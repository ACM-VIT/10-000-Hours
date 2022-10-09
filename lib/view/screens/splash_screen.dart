import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ten_thousand_hours/view/screens/home_screen.dart';
import 'package:ten_thousand_hours/view/screens/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
    static String id = "SplashScreen";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
    splash: 'assets/logo.png', 
    splashIconSize:200, 
    nextScreen: OnboardingScreen(),    
    );

  }
}
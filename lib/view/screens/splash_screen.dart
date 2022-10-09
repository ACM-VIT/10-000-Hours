import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ten_thousand_hours/view/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String id = "SplashScreen";

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: InkWell(
        onTap: () {
          Navigator.pushNamed(context, HomeScreen.id);
        },
        child: Container(
          height: mediaQuery.size.height,
          width: mediaQuery.size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffb4b4b4),
                Color(0xff090909),
              ],
              stops: [
                0.20,
                0.65,
              ],
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: mediaQuery.padding.top,
                child: Container(
                  padding: const EdgeInsets.only(left: 20),
                  width: mediaQuery.size.width,
                  color: const Color(0xff959595),
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'HabiTrack',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.more_vert),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: mediaQuery.size.width,
                height: mediaQuery.size.width,
                child: SvgPicture.asset('lib/assets/splash_screen.svg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

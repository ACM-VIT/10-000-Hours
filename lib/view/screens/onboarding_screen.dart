import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ten_thousand_hours/view/screens/home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  static String id = 'OnboardingScreen';
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final onboardingPagesList = [
    buildPage(
      title: 'Show up regularly',
      description:
          "Practice isn’t the thing you do once you’re good. It’s the thing you do that makes you good.",
    ),
    buildPage(
      title: '8 hours a Day, 5 Days a  week',
      description: 'Confidence – Preservance - Resilience',
    ),
    buildPage(
      title: 'For 1 year',
      description:
          'Throughout his book, Gladwell repeatedly refers to the “10 000-hour rule,” asserting that the key to achieving true expertise in any skill is simply a matter of practicing, albeit in the correct way, for at least 10 000 hours.',
    ),
  ];
  final controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF4EA),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      controller.jumpToPage(onboardingPagesList.length - 1);
                    },
                    child: Visibility(
                      visible: !isLastPage,
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF181818),
                        ),
                      ),
                    ),
                  ),
                ),


            Expanded(
              flex: 3,
              child: Container(
                child: PageView(
                  controller: controller,
                  onPageChanged: (index) {
                    setState(() {
                      if (onboardingPagesList.length-1 == index) {
                        setState(() {
                          isLastPage = true;
                        });
                      } else {
                        setState(() {
                          isLastPage = false;
                        });
                      }
                    });
                  },
                  children: onboardingPagesList,
                ),
              ),
            ),

            Expanded(

              child: SmoothPageIndicator(
                controller: controller,
                count: onboardingPagesList.length,
                effect: const ExpandingDotsEffect(
                    dotWidth: 6,
                    dotHeight: 6,
                    activeDotColor: Colors.black,
                    dotColor: Color(0x77403D3A)),
                onDotClicked: (index) => controller.animateToPage(index,
                    duration: const Duration(microseconds: 500),
                    curve: Curves.easeInOut),
              ),
            ),
            RawMaterialButton(
                onPressed: isLastPage
                    ? () {
                        Navigator.pushNamed(context, HomeScreen.id);
                      }
                    : () {
                        controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      },
                constraints: BoxConstraints.tight(const Size(double.infinity, 42)),
                elevation: 7,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                fillColor: const Color(0xFF0148FF),
                child: Text(
                  isLastPage ? 'Continue' : 'Next',
                  style:
                      const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
                ),
              ),

          ],
        ),
      ),
    );
  }
}

Widget buildPage({String? title, String? description}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        '$title',
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      const SizedBox(
        height: 50,
      ),
      Text(
        '$description',
        textAlign: TextAlign.center,
      ),
    ],
  );
}

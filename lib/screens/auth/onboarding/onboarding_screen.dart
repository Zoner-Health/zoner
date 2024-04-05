import 'package:flutter/material.dart';
import 'package:zoner/screens/auth/onboarding/components/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  final List<Map<String, String>> onboardingData = [
    {"title": "Welcome to Zoner", "text": "Blah", "iconPath": ""},
    {"title": "Consult and Diagnose", "text": "Blah", "iconPath": ""},
    {"title": "Order Medication &\nLab Tests", "text": "Blah", "iconPath": ""},
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          controller: _pageController,
          itemCount: onboardingData.length,
          itemBuilder: (context, index) {
            return OnboardingPage(
                title: onboardingData[index]["title"]!,
                text: onboardingData[index]["text"]!,
                onSkipPressed: () {
                  ///Todo: Navigate to sign in page
                },
                onPreviousPressed: () {
                  _pageController.previousPage(
                      duration: const Duration(
                        milliseconds: 300,
                      ),
                      curve: Curves.easeInOut);
                },
                onNextPressed: () {
                  ///If current index is the last item, then navigate to the sign up page instead

                  if (index == onboardingData.length - 1) {
                    ///Todo: Navigate to sign in page instead
                  } else {
                    _pageController.nextPage(
                        duration: const Duration(
                          milliseconds: 300,
                        ),
                        curve: Curves.easeInOut);
                  }
                });
          }),
    );
  }
}

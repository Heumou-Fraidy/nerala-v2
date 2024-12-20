import 'package:flutter/material.dart';
import 'package:other_screens/common/constants.dart';
import 'package:other_screens/common/widgets/custom_button.dart';
import 'package:other_screens/presentation/auth/pages/login_page.dart';
import 'package:other_screens/presentation/auth/pages/register_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            spacing: 14,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  color: scaffoldBgColor,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/icons/one-bar.png"),
                        const SizedBox(
                          height: 19,
                        ),
                        Image.asset("assets/icons/bubble.png"),
                        Image.asset("assets/logo.png"),
                        const Text(
                          "N E R A L A",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 38.0),
                          child: const Text(
                            "Learn Languages whenever and wherever you want. ",
                            style: TextStyle(fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32.0),
              CustomButton(
                onPressed: () {
                  // Navigate to "Get Started" screen
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                isEnabled: true,
                text: 'GET STARTED',
              ),
              CustomButton(
                onPressed: () {
                  // Navigate to "LOG IN" screen
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                isEnabled: true,
                text: 'LOG IN',
              ),
              SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
    );
  }
}
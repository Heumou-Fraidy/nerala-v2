import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:other_screens/common/constants.dart';
import 'package:other_screens/common/widgets/custom_button.dart';
import 'package:other_screens/common/widgets/forms/password_text_formfield.dart';
import 'package:other_screens/common/widgets/forms/simple_text_formfield.dart';
import 'package:other_screens/presentation/auth/pages/login_page.dart';
import 'package:other_screens/presentation/onboarding/pages/goal_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _registerFormKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // Forms fields
  String? email;

  String? password;
  String? confirmPassword;

  // Form validation
  bool isEmailFilled = false;

  bool doRememberYou = false;

  bool isPasswordFilled = false;

  bool isConfirmPasswordFilled = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        isEmailFilled = _emailController.text.isNotEmpty;
      });
    });

    _passwordController.addListener(() {
      setState(() {
        isPasswordFilled = _passwordController.text.isNotEmpty;
      });
    });
    _confirmPasswordController.addListener(() {
      setState(() {
        isConfirmPasswordFilled = _confirmPasswordController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var allPadding = EdgeInsets.all(15);
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: scaffoldBgColor,
        title: Text("Sign Up"),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: ListView(
          children: [
            const SizedBox(
              height: 15,
            ),
            Image.asset(
              "assets/images/mom-girl.png",
              width: 155,
              height: 151,
            ),

            const SizedBox(
              height: 15,
            ),
            //form

            Form(
              key: _registerFormKey,
              child: ListView(
                shrinkWrap: true,
                padding: allPadding * 1.25,
                children: [
                  SimpleTextFormField(
                    controller: _emailController,
                    hintText: "Email address",
                    prefixIcon: Image.asset("assets/icons/email.png"),
                    onChanged: (value) => email = value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email address is required";
                      }

                      if (!RegExp(emailRegex).hasMatch(value)) {
                        return 'Enter a valid email address';
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  PasswordTextFormField(
                    controller: _passwordController,
                    hintText: "Password",
                    prefixIcon: Icon(HugeIcons.strokeRoundedLockPassword),
                    onChanged: (value) => password = value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  PasswordTextFormField(
                    controller: _confirmPasswordController,
                    hintText: "Confirm Password",
                    prefixIcon: Icon(HugeIcons.strokeRoundedLockPassword),
                    onChanged: (value) => confirmPassword = value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Confirm password is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
            ),

            //button

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: CustomButton(
                onPressed: (isEmailFilled &&
                        isPasswordFilled &&
                        isConfirmPasswordFilled)
                    ? () {
                        if (_registerFormKey.currentState!.validate()) {
                          // Save and proceed
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const GoalsPage()));
                        }
                      }
                    : null,
                text: 'REGISTER',
              ),
            ),

            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text(
                "Already In?",
                textAlign: TextAlign.center,
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              "Or Continue With",
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Image.asset("assets/icons/facebook.png"),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset("assets/icons/google.png"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
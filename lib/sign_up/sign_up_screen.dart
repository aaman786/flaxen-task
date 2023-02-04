import 'package:auth_flaxen/global/utils/progress_indicator.dart';
import 'package:auth_flaxen/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/controller/auth_controller.dart';
import '../widgets/textfield.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  static const String routeName = '/signup';
  const SignUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController contactController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    genderController.dispose();
    contactController.dispose();
    super.dispose();
  }

  void signUpUser() async {
    ref.read(authControllerProvider.notifier).signUp(
        context,
        usernameController.text,
        passwordController.text,
        emailController.text,
        contactController.text,
        genderController.text);
  }

  void navigateToLogInScreen() {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Sign Up",
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: usernameController,
              hintText: 'Enter your Username',
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: emailController,
              hintText: 'Enter your email',
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: contactController,
              hintText: 'Enter your Contact',
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: genderController,
              hintText: 'Enter your gender',
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: passwordController,
              hintText: 'Enter your password',
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: signUpUser,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              textStyle: MaterialStateProperty.all(
                const TextStyle(color: Colors.white),
              ),
              minimumSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width / 2.5, 50),
              ),
            ),
            child: isLoading
                ? const Loader()
                : const Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: navigateToLogInScreen,
            child: RichText(
                text: const TextSpan(
              children: [
                TextSpan(
                    text: "Already have an account?.. ",
                    style: TextStyle(fontSize: 14, color: Colors.blue)),
                TextSpan(
                    text: " Log In ",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.lightBlueAccent,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline)),
              ],
            )),
          )
        ],
      ),
    );
  }
}

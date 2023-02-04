import 'dart:ffi';

import 'package:auth_flaxen/model/user_model.dart';
import 'package:auth_flaxen/services/controller/auth_controller.dart';
import 'package:auth_flaxen/services/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../global/utils/error_text.dart';
import '../global/utils/progress_indicator.dart';

class HomeScreen extends ConsumerWidget {
  static const String routeName = "/home";
  const HomeScreen({super.key});

  void logOut(BuildContext context, WidgetRef ref) {
    ref.read(authControllerProvider.notifier).logOut(context);
  }

  void getUser() {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Data')),
      body: Column(
        children: [
          ref.watch(alluserDataProvider).when(
              data: (data) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: const Color.fromARGB(255, 113, 155, 176),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  userInfoRichText(
                                      data[index].username, 'Username'),
                                  userInfoRichText(data[index].email, 'Email'),
                                ],
                              ),
                              const SizedBox(height: 05),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  userInfoRichText(
                                      data[index].contact, 'Contact'),
                                  userInfoRichText(
                                      data[index].gender, 'Gender'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
              error: (error, stackTrace) => ErrorText(error: error.toString()),
              loading: () => const Loader()),
          TextButton(
              onPressed: () => logOut(context, ref),
              child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.brown.shade400,
                  child: const Text('Log Out',
                      style: TextStyle(color: Colors.white)))),
          const SizedBox(height: 05),
          TextButton(
              onPressed: getUser,
              child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.brown.shade400,
                  child: const Text(
                    'Get Users',
                    style: TextStyle(color: Colors.white),
                  ))),
        ],
      ),
    );
  }

  RichText userInfoRichText(String userInfo, String text) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(text: text),
        const TextSpan(text: ' :- '),
        TextSpan(text: userInfo, style: const TextStyle(color: Colors.black)),
      ]),
    );
  }
}

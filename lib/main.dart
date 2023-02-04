import 'package:auth_flaxen/global/utils/progress_indicator.dart';
import 'package:auth_flaxen/home/home_page.dart';
import 'package:auth_flaxen/login/login_screen.dart';
import 'package:auth_flaxen/services/controller/auth_controller.dart';
import 'package:auth_flaxen/sign_up/sign_up_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  // Future<void> checkStart() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   firstStart = prefs.getString("startFirstTime");
  //   setState(() {});
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   // checkStart();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // scaffoldMessengerKey: messangerKey,
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (((settings) => generateRoute(settings))),
      home: StreamBuilder(
          stream: ref.watch(authControllerProvider.notifier).authStateChange,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return const HomeScreen();
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.black,
              ));
            }
            return const SignUpScreen();
          }),
      // home: const SignUpScreen(),
    );
  }
}

import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit/features/auth/controller/auth_controller.dart';
import 'package:reddit/firebase_options.dart';
import 'package:reddit/themes/pallette.dart';
import 'package:reddit/rou'
import 'package:routemaster/routemaster.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  //we will use route master for navigation
  //this helps when app is used on the web as well since we can define the routes easier
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(authStateChangeProvider).when(
          data: (data) => MaterialApp.router(
            routerDelegate: RoutemasterDelegate(routesBuilder: (context) => loggedOutRoutes),
        routeInformationParser:const RoutemasterParser(),
            title: 'Reddit',
            theme: Pallete.darkModeAppTheme,
          ),
          error: (error, stackTrace) => Center(
            child: Text(error.toString()),
          ),
          loading: () => const CircularProgressIndicator(),
        );
  }
}

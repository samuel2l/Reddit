import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit/features/auth/controller/auth_controller.dart';
import 'package:reddit/features/models/user_model.dart';
import 'package:reddit/firebase_options.dart';
import 'package:reddit/routes.dart';
import 'package:reddit/themes/pallette.dart';
import 'package:routemaster/routemaster.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  UserModel? userModel;
  void getData(WidgetRef ref, User data) async {
    userModel = await ref
        .watch(authControllerProvider.notifier)
        .getUserData(data.uid)
        .first;
    ref.read(userProvider.notifier).update((state) => userModel);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(authStateChangeProvider).when(
          data: (data) => MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerDelegate: RoutemasterDelegate(routesBuilder: (context) {
              print(data);
              if (data == null || userModel==null) {
                return loggedOutRoutes;
              }
              //  else {
              //   return loggedOutRoutes;
              // }
              // if (data != null) {
              // if (data) {
              getData(ref, data);
              //so if there is data it means user is logged in and the userModel var should not be null
              // if (userModel != null) {
              return loggedInRoutes;
              // }
              // }
              // return loggedOutRoutes;
            }),
            routeInformationParser: const RoutemasterParser(),
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

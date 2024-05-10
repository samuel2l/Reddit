import 'package:flutter/material.dart';
import 'package:reddit/widgets/sign_in_bt.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
SignInBtn(),
          TextButton(onPressed: (){}, child: Text('Sign in as guest')),

        ],
      ),
    );
  }
}
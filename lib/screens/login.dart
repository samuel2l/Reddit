import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextButton(onPressed: (){}, child: Text('Continue with Google')),
          TextButton(onPressed: (){}, child: Text('Sign in as guest')),

        ],
      ),
    );
  }
}
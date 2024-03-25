import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../routes/go_router.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool loggedIn = false;

  @override
  void initState() {
    super.initState();
    loggedIn = isLoggedIn;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => context.pop(), icon: const Icon(Icons.arrow_back)),
        title: const Text("Login to navigate to provider page"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(loggedIn ? "You are logged in" : "You are not logged in"),
            const SizedBox(height: 10, width: double.maxFinite),
            ElevatedButton(
              onPressed: () {
                setState(() => loggedIn = !loggedIn);
                isLoggedIn = loggedIn;
              },
              child: Text(loggedIn ? "Log Out" : "Log In"),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

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
        leading: const SizedBox.shrink(),
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10, width: double.maxFinite),
            const Text("Log in to access provider page"),
            const SizedBox(height: 20),
            Text(loggedIn ? "You are logged in" : "You are not logged in"),
            const SizedBox(height: 10),
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

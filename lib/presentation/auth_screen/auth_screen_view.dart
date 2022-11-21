import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_project/presentation/auth_screen/auth_screen_event.dart';
import 'package:text_project/presentation/auth_screen/auth_screen_view_model.dart';
import 'package:text_project/presentation/auth_screen/components/sign_in_form.dart';
import 'package:text_project/presentation/auth_screen/components/sign_up_form.dart';
import 'package:text_project/presentation/initial_screen/initial_screen_view.dart';

class AuthScreenView extends StatefulWidget {
  const AuthScreenView({Key? key}) : super(key: key);

  @override
  State<AuthScreenView> createState() => _AuthScreenViewState();
}

class _AuthScreenViewState extends State<AuthScreenView> {
  StreamSubscription<AuthScreenEvent>? _streamSubscription;

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final viewModel = context.read<AuthScreenViewModel>();

      _streamSubscription = viewModel.eventStream.listen(
        (event) {
          event.when(
            onAuthError: (String message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                ),
              );
            },
            onSignInSuccess: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const InitialScreenView(),
                ),
              );
            },
            onSignUpSuccess: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const InitialScreenView(),
                ),
              );
            },
          );
        },
      );
    });
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AuthScreenViewModel>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            viewModel.state.isSignIn ? const SignInForm() : const SignUpForm(),
          ],
        ),
      ),
    );
  }
}

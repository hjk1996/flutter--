import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:text_project/presentation/auth_screen/auth_screen_view_model.dart';
import 'package:text_project/presentation/auth_screen/components/sign_in_form.dart';
import 'package:text_project/presentation/auth_screen/components/sign_up_form.dart';

// TODO: 로그인 화면 만들기
class AuthScreenView extends StatefulWidget {
  const AuthScreenView({Key? key}) : super(key: key);

  @override
  State<AuthScreenView> createState() => _AuthScreenViewState();
}

class _AuthScreenViewState extends State<AuthScreenView> {
  @override
  void dispose() {
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

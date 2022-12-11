import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:text_project/presentation/auth_screen/auth_screen_view_model.dart';
import 'package:text_project/presentation/common/constants.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    final viewModel = context.read<AuthScreenViewModel>();
    _emailController.addListener(() {
      viewModel.setEmail = _emailController.text;
    });
    _passwordController.addListener(() {
      viewModel.setPassword = _passwordController.text;
    });
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<AuthScreenViewModel>();
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: const InputDecoration(hintText: 'e-mail'),
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: viewModel.validateEmail,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {},
          ),
          const SizedBox(
            height: AUTH_FORM_FIELD_GAP,
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: 'password'),
            controller: _passwordController,
            validator: viewModel.validatePassword,
            obscureText: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          const SizedBox(
            height: AUTH_FORM_FIELD_GAP,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: viewModel.toggleAuthMode,
                child: const Text('계정이 없나요?'),
              ),
            ],
          ),
          const SizedBox(
            height: AUTH_FORM_FIELD_GAP,
          ),
          Consumer<AuthScreenViewModel>(
            builder: (context, vm, child) {
              return ElevatedButton(
                onPressed: vm.isValid ? vm.onAuthButtonClick : null,
                child: const Text('로그인'),
              );
            },
          ),
        ],
      ),
    );
  }
}

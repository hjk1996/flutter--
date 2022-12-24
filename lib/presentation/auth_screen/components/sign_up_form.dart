import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_project/presentation/auth_screen/auth_screen_view_model.dart';
import 'package:text_project/presentation/common/constants.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    final viewModel = context.read<AuthScreenViewModel>();
    _emailController.addListener(() {
      viewModel.email = _emailController.text;
    });
    _passwordController.addListener(() {
      viewModel.password = _passwordController.text;
    });
    _confirmPasswordController.addListener(() {
      viewModel.confirmPassword = _confirmPasswordController.text;
    });
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
            decoration: const InputDecoration(hintText: '이메일'),
            controller: _emailController,
            validator: viewModel.validateEmail,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: AUTH_FORM_FIELD_GAP,
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: '비밀번호'),
            controller: _passwordController,
            obscureText: true,
            validator: viewModel.validatePassword,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          const SizedBox(
            height: AUTH_FORM_FIELD_GAP,
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: '비밀번호 확인'),
            controller: _confirmPasswordController,
            obscureText: true,
            validator: viewModel.validateConfirmPassword,
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
                child: const Text('이미 계정이 있어요'),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Consumer<AuthScreenViewModel>(builder: (context, vm, child) {
            return ElevatedButton(
              onPressed: vm.isValid ? vm.onAuthButtonClick : null,
              child: const Text('다음'),
            );
          })
        ],
      ),
    );
  }
}

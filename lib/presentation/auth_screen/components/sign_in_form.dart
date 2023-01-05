import 'package:flutter/material.dart';
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
      viewModel.email = _emailController.text;
    });
    _passwordController.addListener(() {
      viewModel.password = _passwordController.text;
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
          const Text(
            '끝말잇기 로그인',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: '이메일'),
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
            decoration: const InputDecoration(hintText: '비밀번호'),
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
              if (vm.state.isLoading) {
                return const CircularProgressIndicator();
              }

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

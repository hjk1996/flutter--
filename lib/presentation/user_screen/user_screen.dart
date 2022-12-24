import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_project/presentation/auth_screen/auth_screen_view.dart';
import 'package:text_project/presentation/common/yes_or_no_dialog.dart';
import 'package:text_project/presentation/edit_screen/edit_screen.dart';
import 'package:text_project/presentation/user_screen/user_screen_event.dart';
import 'package:text_project/presentation/user_screen/user_screen_view_model.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late StreamSubscription<UserScreenEvent> _eventSubscription;

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final viewModel = context.read<UserScreenViewModel>();
      _eventSubscription = viewModel.eventStream.listen((event) {
        event.when(
          onDeleteAccountTap: () async {
            final res =
                await askYesOrNo(context: context, content: '정말로 탈퇴하시겠습니까?');
            if (res != null && res) {
              await viewModel.deleteUserAccount();
              if (!mounted) return;

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const AuthScreenView(),
                ),
              );
            }
          },
          onVerifyEmailTap: (verified) async {
            if (verified) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('이미 인증된 이메일입니다.'),
                ),
              );
            } else {
              final email = await viewModel.verifyEmail();
              if (email == null) return;
              if (!mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('$email에 인증 이메일을 보냈습니다.'),
                ),
              );
            }
          },
          onEditPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EditScreen(),
              ),
            );
          },
          onError: (message) {},
          onProfileTap: () {},
          onSave: () {},
        );
      });
    });
  }

  @override
  void dispose() {
    _eventSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('내 정보'),
      ),
      body: FutureBuilder(
          future: context.read<UserScreenViewModel>().getUserInfo(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100,
                            width: double.infinity,
                            child: Consumer<UserScreenViewModel>(
                              builder: (context, vm, child) {
                                return Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 50,
                                      backgroundImage: vm.state.realPhoto ==
                                              null
                                          ? null
                                          : MemoryImage(vm.state.realPhoto!),
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          vm.state.realName ?? '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text('70승 10패')
                                      ],
                                    ),
                                    const Spacer(),
                                    IconButton(
                                        onPressed: context
                                            .read<UserScreenViewModel>()
                                            .onEditPressed,
                                        icon: const Icon(
                                            Icons.arrow_forward_ios_outlined))
                                  ],
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: context
                                .read<UserScreenViewModel>()
                                .onVerifyEmailTap,
                            child: const SizedBox(
                              width: double.infinity,
                              height: 70,
                              child: Card(
                                child: ListTile(
                                  title: Text(
                                    '이메일 인증',
                                  ),
                                  trailing: Icon(Icons.verified),
                                ),
                              ),
                            ),
                          ),
                          const Divider(),
                          GestureDetector(
                            onTap: context
                                .read<UserScreenViewModel>()
                                .onDeleteAccountTap,
                            child: const SizedBox(
                              width: double.infinity,
                              height: 70,
                              child: Card(
                                child: ListTile(
                                  title: Text(
                                    '회원 탈퇴',
                                  ),
                                  trailing: Icon(Icons.delete),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_project/presentation/auth_screen/auth_screen_view.dart';
import 'package:text_project/presentation/common/yes_or_no_dialog.dart';
import 'package:text_project/presentation/edit_screen/edit_screen.dart';
import 'package:text_project/presentation/user_screen/components/password_dialog.dart';
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
            if (res == null || res == false) return;

            final message = await showDialog<String?>(
              context: context,
              builder: (context) => const PasswordDialog(),
            );

            if (!mounted) return;

            if (message != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                ),
              );
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const AuthScreenView(),
                ),
              );

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('회원탈퇴에 성공했습니다.'),
                ),
              );
            }

            // {
            //   await viewModel.deleteUserAccount();
            //   if (!mounted) return;

            //   Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => const AuthScreenView(),
            //     ),
            //   );
            // }
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
          onError: (message) {
            print(message);
          },
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
                                      child: vm.state.realPhoto == null
                                          ? const Icon(Icons.person)
                                          : null,
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
                                          height: 10,
                                        ),
                                        Text(
                                          '${vm.wins}승 ${vm.losses}패',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        )
                                      ],
                                    ),
                                    const Spacer(),
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
                                .onEditPressed,
                            child: const SizedBox(
                              width: double.infinity,
                              height: 70,
                              child: Card(
                                child: ListTile(
                                  title: Text(
                                    '유저 정보 수정',
                                  ),
                                  trailing: Icon(Icons.settings),
                                ),
                              ),
                            ),
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
                                    '인증 메일 다시 보내기',
                                  ),
                                  trailing: Icon(Icons.verified),
                                ),
                              ),
                            ),
                          ),
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
